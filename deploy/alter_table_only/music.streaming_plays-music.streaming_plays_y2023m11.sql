-- Deploy id.me:alter_table_only/music.streaming_plays-music.streaming_plays_y2023m11 to pg
-- requires: schema/music
-- requires: table/music.streaming_plays

BEGIN;

ALTER TABLE ONLY music.streaming_plays ATTACH PARTITION music.streaming_plays_y2023m11 FOR VALUES FROM ('2023-11-01 00:00:00') TO ('2023-12-01 00:00:00');

COMMIT;
