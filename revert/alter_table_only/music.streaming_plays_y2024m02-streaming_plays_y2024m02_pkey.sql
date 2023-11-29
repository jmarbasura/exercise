-- Revert id.me:alter_table_only/music.streaming_plays_y2024m02-streaming_plays_y2024m02_pkey from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2024m02 DROP CONSTRAINT streaming_plays_y2024m02_pkey;

COMMIT;
