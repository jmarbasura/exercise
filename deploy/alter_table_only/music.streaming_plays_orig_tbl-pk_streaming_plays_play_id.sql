-- Deploy id.me:alter_table_only/music.streaming_plays_orig_tbl-pk_streaming_plays_play_id to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_orig_tbl

BEGIN;

ALTER TABLE ONLY music.streaming_plays_orig_tbl
    ADD CONSTRAINT pk_streaming_plays_play_id PRIMARY KEY (play_id);

COMMIT;
