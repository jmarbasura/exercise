-- Revert id.me:alter_table_only/music.streaming_plays_y2023m12-streaming_plays_y2023m12_pkey from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2023m12 DROP CONSTRAINT streaming_plays_y2023m12_pkey;

COMMIT;
