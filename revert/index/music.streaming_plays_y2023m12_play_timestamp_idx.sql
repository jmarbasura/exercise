-- Revert id.me:index/music.streaming_plays_y2023m12_play_timestamp_idx from pg

BEGIN;

DROP INDEX IF EXISTS music.streaming_plays_y2023m12_play_timestamp_idx;

COMMIT;
