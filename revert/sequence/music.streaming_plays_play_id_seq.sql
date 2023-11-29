-- Revert id.me:sequence/music.streaming_plays_play_id_seq from pg

BEGIN;

DROP SEQUENCE IF EXISTS music.streaming_plays_play_id_seq;

COMMIT;
