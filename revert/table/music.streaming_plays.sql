-- Revert id.me:table/music.streaming_plays from pg

BEGIN;

DROP TABLE IF EXISTS music.streaming_plays;

COMMIT;
