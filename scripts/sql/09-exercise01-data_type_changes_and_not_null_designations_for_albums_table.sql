
begin;
ALTER TABLE music.albums ALTER COLUMN album_id SET not null, ALTER COLUMN album TYPE text, ALTER COLUMN album SET not null, ALTER COLUMN artist_name TYPE text, ALTER COLUMN artist_name SET not null, ALTER COLUMN release_date SET not null, ALTER COLUMN genres SET DEFAULT '{}', ALTER COLUMN genres SET not null, ALTER COLUMN descriptors TYPE text ;
ALTER TABLE music.albums add primary key(album_id);
ALTER INDEX music.albums_pkey RENAME TO pk_albums_album_id;
commit;

