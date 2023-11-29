-- Revert id.me:alter_table_only/music.streaming_plays_y2023m09-streaming_plays_y2023m09_pkey from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2023m09 DROP CONSTRAINT streaming_plays_y2023m09_pkey;

COMMIT;
