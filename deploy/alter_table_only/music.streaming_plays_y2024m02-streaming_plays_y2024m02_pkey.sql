-- Deploy id.me:alter_table_only/music.streaming_plays_y2024m02-streaming_plays_y2024m02_pkey to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_y2024m02

BEGIN;

ALTER TABLE ONLY music.streaming_plays_y2024m02
    ADD CONSTRAINT streaming_plays_y2024m02_pkey PRIMARY KEY (play_id, play_timestamp);

COMMIT;
