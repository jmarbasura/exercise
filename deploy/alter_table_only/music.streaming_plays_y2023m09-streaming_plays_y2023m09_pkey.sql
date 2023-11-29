-- Deploy id.me:alter_table_only/music.streaming_plays_y2023m09-streaming_plays_y2023m09_pkey to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m09

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2023m09
    ADD CONSTRAINT streaming_plays_y2023m09_pkey PRIMARY KEY (play_id, play_timestamp);

COMMIT;
