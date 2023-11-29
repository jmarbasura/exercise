-- Deploy id.me:alter_table_only/music.streaming_plays-pk_streaming_plays_play_id_play_timestamp to pg
-- requires: schema/music
-- requires: table/music.streaming_plays

BEGIN;

ALTER TABLE ONLY music.streaming_plays
    ADD CONSTRAINT pk_streaming_plays_play_id_play_timestamp PRIMARY KEY (play_id, play_timestamp);

COMMIT;
