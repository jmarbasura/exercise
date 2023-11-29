-- Revert id.me:alter_table_only/music.albums-pk_albums_album_id from pg

BEGIN;

ALTER TABLE music.albums DROP CONSTRAINT pk_albums_album_id;

COMMIT;
