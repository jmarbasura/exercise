-- Revert id.me:alter_table_only/music.streaming_plays_orig_tbl-uniq_streaming_plays_orig from pg

BEGIN;

ALTER TABLE music.streaming_plays_orig_tbl DROP CONSTRAINT uniq_streaming_plays_orig;

COMMIT;
