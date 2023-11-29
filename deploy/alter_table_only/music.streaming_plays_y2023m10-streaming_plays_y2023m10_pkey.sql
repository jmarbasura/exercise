-- Deploy id.me:alter_table_only/music.streaming_plays_y2023m10-streaming_plays_y2023m10_pkey to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2023m10

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2023m10
    ADD CONSTRAINT streaming_plays_y2023m10_pkey PRIMARY KEY (play_id, play_timestamp);

COMMIT;
