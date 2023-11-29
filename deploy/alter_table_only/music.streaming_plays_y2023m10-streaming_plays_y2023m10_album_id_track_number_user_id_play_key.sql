-- Deploy id.me:alter_table_only/music.streaming_plays_y2023m10-streaming_plays_y2023m10_album_id_track_number_user_id_play_key to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m10

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2023m10
    ADD CONSTRAINT streaming_plays_y2023m10_album_id_track_number_user_id_play_key UNIQUE (album_id, track_number, user_id, play_timestamp);

COMMIT;
