-- Revert id.me:sequence/music.albums_album_id_seq from pg

BEGIN;

DROP SEQUENCE IF EXISTS music.albums_album_id_seq;

COMMIT;
