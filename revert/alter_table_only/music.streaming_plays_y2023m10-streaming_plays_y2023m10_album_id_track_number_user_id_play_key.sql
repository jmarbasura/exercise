-- Revert id.me:alter_table_only/music.streaming_plays_y2023m10-streaming_plays_y2023m10_album_id_track_number_user_id_play_key from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2023m10 DROP CONSTRAINT streaming_plays_y2023m10_album_id_track_number_user_id_play_key;

COMMIT;
