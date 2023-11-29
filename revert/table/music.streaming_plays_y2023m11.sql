-- Revert id.me:table/music.streaming_plays_y2023m11 from pg

BEGIN;

DROP TABLE IF EXISTS music.streaming_plays_y2023m11;

COMMIT;
