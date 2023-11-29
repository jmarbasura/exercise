-- Deploy id.me:alter_table_only/music.streaming_plays_y2023m11-streaming_plays_y2023m11_pkey to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m11

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2023m11
    ADD CONSTRAINT streaming_plays_y2023m11_pkey PRIMARY KEY (play_id, play_timestamp);

COMMIT;
