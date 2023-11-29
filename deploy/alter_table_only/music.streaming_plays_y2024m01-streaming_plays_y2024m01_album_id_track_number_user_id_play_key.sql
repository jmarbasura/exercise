-- Deploy id.me:alter_table_only/music.streaming_plays_y2024m01-streaming_plays_y2024m01_album_id_track_number_user_id_play_key to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2024m01

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2024m01
    ADD CONSTRAINT streaming_plays_y2024m01_album_id_track_number_user_id_play_key UNIQUE (album_id, track_number, user_id, play_timestamp);

COMMIT;
