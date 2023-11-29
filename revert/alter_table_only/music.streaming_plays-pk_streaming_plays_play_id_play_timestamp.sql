-- Revert id.me:alter_table_only/music.streaming_plays-pk_streaming_plays_play_id_play_timestamp from pg

BEGIN;

ALTER TABLE music.streaming_plays DROP CONSTRAINT pk_streaming_plays_play_id_play_timestamp;

COMMIT;
