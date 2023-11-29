# Issues


## **Exercise 1**

Fundamentally, the schema itself requires an overhaul. My approach is catered to this under the assumption this is for a highly concurrently production system. The changes themselves are located in the scripts/sql folder of the scripts folder in the attached repo.


### ISSUES (all tables)

 - lack of sequences 
	 - each id would have to come from the application (hibernate can prefetch and hard code the IDs upon insert, but it is best to leave it up to the DBMS and allow the sequence management to be controlled within the DBMS and not require the application dependency)
 - there are no foreign keys
 - there are unique constraints
 - no created_at column
 - no updated_at tables
 - lack of default values and NOT NULL designation for appropriate columns
 - application tables and related objects are entirely within the public schema
 - everything is in the public schema
 - data type issues (also further elaborated by table in the proposal section below)
	 - users table
		 - every text column is a CHAR(255) and some of the columns are int and should be int
		 - the current design violates 1NF and also updates in place the address changes without a history of addresses (not sure if this is relevant for the streaming business)
		 - however the table conflates two aspects of the user (the electronic login attributes and the psychical address attributes)
			 - street_address should be a part of a separate table
			 - city should be a part of a separate table
			 - state should be a part of a separate table
			 - country should be a part of a separate table
			 - 
 - albums table
	 - album_id better served as an int without the prepending A

 - streaming_plays table
	 - enum usage
  
 

### PROPOSAL 

 - creation of a music schema
 - creation of sequences for the tables
 - creation of sequences for the tables
 - addition of created_at and updated_at columns for the tables
 - creation of foreign keys for the tables

 - users table
	 - album_id converted to int 
	 - separating the below columns to the user_addresses table
		 - street_address 
		 - city
		 - state
		 - country
	 - get rid of the enum type created for user_tier and have a lookup table with a foreign key this way we can add without having to change the enum and we remove the enum as it can and has posed upgrade problems for certain cases

 - creation of a lookup schema specifically for lookup tables
 - creation of a tiers table in the lookup schema to replace the enum for tiers
	 - while you do save some byte overhead using the enum, I have traditionally shied away due to upgrade issues that can crop up depending on the version

 - albums table
	 - album_id to become and integer and use a sequence
	 - release_date converting to date
	 - genres becoming an array datatype
		 - we can ensure ternary logic sanity by making the default to be a null array
			 - this is largely done to make it possible to obtain a null value only if the array itself is null so as not to having a confusing data issue with two ways at arriving at null (ex NULL itself and the empty array which is null with 0 elements)
	 - dropping the mistake column containing all of the column names with spaces "album_id  album   artist_name     release_date    genres  average_rating  n"
	 - average_rating column, number_of_reviews, and number_of_ratings should not be part of this table (outside of being a 3NF violation, the amount of updates that would have to occur periodically to keep up to date for what is in essence a catalog lookup table is an antipattern
		 - there would be some follow up with the stakeholders in question, but recommendation would be to separate out to another table to be able to also audit the ratings given as that is not currently possible
  

 - streaming_plays table
	 - user_id change to NOT NULL
	 - user_id datatype should be INT along with associated update to the data
	 - album_id should be NOT NULL
	 - album_id removal of alphanumeric
	 - track_number really does not have a reference to the track and the details pertaining the track
		 - there should be an album_tracks table (did not implement due to time and needing the track catalog)
	 - unique constraint on album_id, track_number, user_id, play_timestamp
		 - this is to ensure that each play is indeed unique since no user can play the same track for an album at the same time
	 - foreign keys and cleaning up orphaned records and creation of tables to temporarily maintain those orphans
  
The main issue with making changes in a highly concurrent environment is that the deployment on production might require manual intervention depending on the table size and intricacy of the changes. Also the schema management solution, in my opinion does not always need to maintain anything superfluous (like backup tables or intermediary work) 

## **Exercise 2**
The initial proposal is chaotic in that it will trigger I/O that can be deferred to be executed on each user login. The concurrency to the streaming plays table will be guaranteed to equal each user login. While very useful to display, it is not critical to obtain an up to the second fetching of this data.

Alternatively, we can defer the I/O cost on the backend for this feature utilizing the database via a materialized view for this purpose.

    create materialized view music.streaming_plays_matview as select play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at from music.streaming_plays with no data;

    refresh materialized view music.streaming_plays_matview;

    create unique index idx_uniq_streaming_plays_matview_play_id on music.streaming_plays_matview using btree(play_id);

 - Now, we can update the materialized view on a schedule

`refresh materialized view concurrently music.streaming_plays_matview;`

 - We could run a cronjob every hour and have it update concurrently (included below is an example of scheduling the job using pg_cron (since I have no access to amend database flags, all that is needed is to add pg_cron to the shared_preload_libraries and have the cron database name be the db in question)

    *SELECT cron.schedule('streaming_plays_matview_refresh', '0 * * * *', 'refresh materialized view concurrently music.streaming_plays_matview');*

The query itself can be part of a method the front end utilizes to asynchronously load the results of the query:
select album_id, track_number, play_timestamp from streaming_plays_matview where user_id=1001 order by play_timestamp desc limit 10;

The advantage is that the I/O required for the lookup does not affect the streaming_plays table itself and effectively retrieves from a static table lagging by one hour. 
(these changes are also noted in *12-exercise02-creating_materialized_view_streaming_plays.sql*)

Also, the lookups themselves will return under a millisecond, which bodes well for the scalability in addition to not hammering the streaming_plays table itself for this feature.

> explain (analyze, verbose, costs, buffers, timing) select album_id,
> track_number, play_timestamp from streaming_plays_matview where
> user_id=1001 order by play_timestamp desc limit 10;
>                                                                           QUERY PL>
> ---------------------------------------------------------------------------------->  
> Limit  (cost=0.42..40.20 rows=10 width=16) (actual time=0.085..0.125
> rows=10 loop>    Output: album_id, track_number, play_timestamp   
> Buffers: shared hit=13    ->  Index Scan Backward using test_both on
> music.streaming_plays_matview  (cost>
>          Output: album_id, track_number, play_timestamp
>          Index Cond: (streaming_plays_matview.user_id = 1001)
>          Buffers: shared hit=13  Planning Time: 0.312 ms  Execution Time: 0.175 ms (9 rows)



## **Exercise 3**
With the current size and the increase in concurrency for the streaming_plays table, mitigating the aggregate I/O impact to this one table will go a long way towards maintaining growth and scale. I propose table partitioning in this instance as it will reduce the amount of data traversed via the various table access methods and make it so that the active data set would not incur a penalty in scanning the entire table should there be an index miss for a particular date range.

We can perform the changes outlined in *13-exercise03-partitioning_streaming_plays_table.sql*

The pros are the reduction of the penalty for a table scan should we incur and index miss. The cons for this approach are that the solution is database specific and assumes the data at this volume even needs to be kept.
