-- Revert id.me:table/music.streaming_plays_y2024m02 from pg

BEGIN;

DROP TABLE IF EXISTS music.streaming_plays_y2024m02;

COMMIT;
