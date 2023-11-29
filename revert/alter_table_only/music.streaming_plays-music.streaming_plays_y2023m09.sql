-- Revert id.me:alter_table_only/music.streaming_plays-music.streaming_plays_y2023m09 from pg

BEGIN;

ALTER TABLE music.streaming_plays DROP PARTITION music.streaming_plays_y2023m09;

COMMIT;
