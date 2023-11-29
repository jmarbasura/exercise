-- Deploy id.me:alter_table_only/music.streaming_plays_orig_tbl-uniq_streaming_plays_orig to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_orig_tbl

BEGIN;

ALTER TABLE ONLY music.streaming_plays_orig_tbl
    ADD CONSTRAINT uniq_streaming_plays_orig UNIQUE (album_id, track_number, user_id, play_timestamp);

COMMIT;
