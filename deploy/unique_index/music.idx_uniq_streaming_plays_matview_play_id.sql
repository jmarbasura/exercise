-- Deploy id.me:unique_index/music.idx_uniq_streaming_plays_matview_play_id to pg
-- requires: schema/music
-- requires: view/music.streaming_plays_matview

BEGIN;

CREATE UNIQUE INDEX idx_uniq_streaming_plays_matview_play_id ON music.streaming_plays_matview USING btree (play_id);

COMMIT;
