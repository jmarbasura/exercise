-- Deploy id.me:alter_table_only/music.albums-pk_albums_album_id to pg
-- requires: schema/music
-- requires: table/music.albums

BEGIN;

ALTER TABLE ONLY music.albums
    ADD CONSTRAINT pk_albums_album_id PRIMARY KEY (album_id);

COMMIT;
