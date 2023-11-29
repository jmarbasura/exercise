-- Revert id.me:alter_table_only/music.streaming_plays_orig_tbl-play_id from pg

BEGIN;

ALTER TABLE ONLY music.streaming_plays_orig_tbl ALTER COLUMN play_id DROP DEFAULT;

COMMIT;
