-- Revert id.me:table/music.streaming_plays_orig_tbl from pg

BEGIN;

DROP TABLE IF EXISTS music.streaming_plays_orig_tbl;

COMMIT;
