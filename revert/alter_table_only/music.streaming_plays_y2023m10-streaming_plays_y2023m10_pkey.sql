-- Revert id.me:alter_table_only/music.streaming_plays_y2023m10-streaming_plays_y2023m10_pkey from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2023m10 DROP CONSTRAINT streaming_plays_y2023m10_pkey;

COMMIT;
