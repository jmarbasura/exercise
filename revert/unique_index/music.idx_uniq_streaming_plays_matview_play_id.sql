-- Revert id.me:unique_index/music.idx_uniq_streaming_plays_matview_play_id from pg

BEGIN;

DROP INDEX IF EXISTS music.idx_uniq_streaming_plays_matview_play_id;

COMMIT;
