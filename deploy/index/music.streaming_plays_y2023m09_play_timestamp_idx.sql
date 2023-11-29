-- Deploy id.me:index/music.streaming_plays_y2023m09_play_timestamp_idx to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m09

BEGIN;

CREATE INDEX streaming_plays_y2023m09_play_timestamp_idx ON music.streaming_plays_y2023m09 USING btree (play_timestamp);

COMMIT;
