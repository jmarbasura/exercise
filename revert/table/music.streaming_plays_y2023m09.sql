-- Revert id.me:table/music.streaming_plays_y2023m09 from pg

BEGIN;

DROP TABLE IF EXISTS music.streaming_plays_y2023m09;

COMMIT;
