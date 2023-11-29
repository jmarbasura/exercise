-- Revert id.me:alter_table_only/music.streaming_plays_orig_tbl-pk_streaming_plays_play_id from pg

BEGIN;

ALTER TABLE music.streaming_plays_orig_tbl DROP CONSTRAINT pk_streaming_plays_play_id;

COMMIT;
