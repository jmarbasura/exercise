-- Revert id.me:table/music.albums from pg

BEGIN;

DROP TABLE IF EXISTS music.albums;

COMMIT;
