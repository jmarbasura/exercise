-- Deploy id.me:alter_table_only/music.streaming_plays-music.streaming_plays_y2023m09 to pg
-- requires: schema/music
-- requires: table/music.streaming_plays

BEGIN;

ALTER TABLE ONLY music.streaming_plays ATTACH PARTITION music.streaming_plays_y2023m09 FOR VALUES FROM ('2023-09-01 00:00:00') TO ('2023-10-01 00:00:00');

COMMIT;
