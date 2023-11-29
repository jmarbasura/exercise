-- Deploy id.me:index/music.streaming_plays_y2023m10_play_timestamp_idx to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m10

BEGIN;

CREATE INDEX streaming_plays_y2023m10_play_timestamp_idx ON music.streaming_plays_y2023m10 USING btree (play_timestamp);

COMMIT;
