--##TODO fix the foreign key to streaming_plays
--##TODO alter the previous uniq constraint and the indexes as well


--WE WILL JUST START WITH THE LATEST MONTH AND BACKFILL THE OTHER PARTITIONS AFTERWARDS

--make sure to get all of the permissions correct

--BEGIN;
--first we will rename to constraints implemented via index
alter index music.uniq_streaming_plays rename to uniq_streaming_plays_orig; 
alter index music.streaming_plays_pkey rename to pk_streaming_plays_play_id_orig;
--alter index pk_streaming_plays_play_id rename to pk_streaming_plays_play_id_orig;

ALTER TABLE music.streaming_plays RENAME TO streaming_plays_orig_tbl;

CREATE TABLE music.streaming_plays (
    play_id integer NOT NULL,
    user_id integer NOT NULL,
    album_id integer NOT NULL,
    track_number integer NOT NULL,
    play_timestamp timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
)
PARTITION BY RANGE (play_timestamp);

ALTER TABLE ONLY music.streaming_plays ALTER COLUMN play_id SET DEFAULT nextval('music.streaming_plays_play_id_seq'::regclass);

ALTER TABLE ONLY music.streaming_plays
    ADD CONSTRAINT pk_streaming_plays_play_id_play_timestamp PRIMARY KEY (play_id, play_timestamp);

ALTER TABLE ONLY music.streaming_plays
    ADD CONSTRAINT uniq_streaming_plays UNIQUE (album_id, track_number, user_id, play_timestamp);


ALTER TABLE music.streaming_plays OWNER TO postgres;

--ALTER TABLE ONLY music.streaming_plays
--    ADD CONSTRAINT game_position_log_hawkeye_v10_pkey_new PRIMARY KEY (play_id, play_timestamp);

CREATE INDEX streaming_plays_play_timestamp ON music.streaming_plays USING btree (play_timestamp);


CREATE TABLE music.streaming_plays_y2023m09 PARTITION OF music.streaming_plays
    FOR VALUES FROM ('2023-09-01') TO ('2023-10-01');

CREATE TABLE music.streaming_plays_y2023m10 PARTITION OF music.streaming_plays
    FOR VALUES FROM ('2023-10-01') TO ('2023-11-01');

CREATE TABLE music.streaming_plays_y2023m11 PARTITION OF music.streaming_plays
    FOR VALUES FROM ('2023-11-01') TO ('2023-12-01');

CREATE TABLE music.streaming_plays_y2023m12 PARTITION OF music.streaming_plays
    FOR VALUES FROM ('2023-12-01') TO ('2024-01-01');

CREATE TABLE music.streaming_plays_y2024m01 PARTITION OF music.streaming_plays
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE music.streaming_plays_y2024m02 PARTITION OF music.streaming_plays
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');


WITH deleted_rows AS (
    DELETE FROM music.streaming_plays_orig_tbl t
    WHERE play_timestamp >= '2023-09-01' AND play_timestamp < '2023-10-01'
    RETURNING t.*
)
INSERT INTO music.streaming_plays_y2023m09
SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at FROM deleted_rows;


WITH deleted_rows AS (
    DELETE FROM music.streaming_plays_orig_tbl t
    WHERE play_timestamp >= '2023-10-01' AND play_timestamp < '2023-11-01'
    RETURNING t.*
)
INSERT INTO music.streaming_plays_y2023m10
SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at FROM deleted_rows;


WITH deleted_rows AS (
    DELETE FROM music.streaming_plays_orig_tbl t
    WHERE play_timestamp >= '2023-11-01' AND play_timestamp < '2023-12-01'
    RETURNING t.*
)
INSERT INTO music.streaming_plays_y2023m11
SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at FROM deleted_rows;


WITH deleted_rows AS (
    DELETE FROM music.streaming_plays_orig_tbl t
    WHERE play_timestamp >= '2023-12-01' AND play_timestamp < '2024-01-01'
    RETURNING t.*
)
INSERT INTO music.streaming_plays_y2023m12
SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at FROM deleted_rows;


--GRANT ALL ON TABLE music.streaming_plays TO jason;
--GRANT SELECT ON TABLE music.streaming_plays TO jason;


--COMMIT;
