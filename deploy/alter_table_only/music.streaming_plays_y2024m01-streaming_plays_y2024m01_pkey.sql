-- Deploy id.me:alter_table_only/music.streaming_plays_y2024m01-streaming_plays_y2024m01_pkey to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2024m01

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2024m01
    ADD CONSTRAINT streaming_plays_y2024m01_pkey PRIMARY KEY (play_id, play_timestamp);

COMMIT;
