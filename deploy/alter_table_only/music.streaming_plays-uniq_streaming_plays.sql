-- Deploy id.me:alter_table_only/music.streaming_plays-uniq_streaming_plays to pg
-- requires: schema/music
-- requires: table/music.streaming_plays

BEGIN;

ALTER TABLE ONLY music.streaming_plays
    ADD CONSTRAINT uniq_streaming_plays UNIQUE (album_id, track_number, user_id, play_timestamp);

COMMIT;
