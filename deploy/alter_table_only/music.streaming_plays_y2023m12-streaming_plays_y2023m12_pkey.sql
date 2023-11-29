-- Deploy id.me:alter_table_only/music.streaming_plays_y2023m12-streaming_plays_y2023m12_pkey to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m12

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2023m12
    ADD CONSTRAINT streaming_plays_y2023m12_pkey PRIMARY KEY (play_id, play_timestamp);

COMMIT;
