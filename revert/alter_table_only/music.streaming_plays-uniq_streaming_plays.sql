-- Revert id.me:alter_table_only/music.streaming_plays-uniq_streaming_plays from pg

BEGIN;

ALTER TABLE music.streaming_plays DROP CONSTRAINT uniq_streaming_plays;

COMMIT;
