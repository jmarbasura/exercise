-- Revert id.me:alter_table_only/music.streaming_plays_y2024m01-streaming_plays_y2024m01_pkey from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2024m01 DROP CONSTRAINT streaming_plays_y2024m01_pkey;

COMMIT;
