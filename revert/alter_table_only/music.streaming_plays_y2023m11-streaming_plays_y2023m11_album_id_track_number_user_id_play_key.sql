-- Revert id.me:alter_table_only/music.streaming_plays_y2023m11-streaming_plays_y2023m11_album_id_track_number_user_id_play_key from pg

BEGIN;

ALTER TABLE music.streaming_plays_y2023m11 DROP CONSTRAINT streaming_plays_y2023m11_album_id_track_number_user_id_play_key;

COMMIT;
