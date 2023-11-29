-- Deploy id.me:alter_table_only/music.streaming_plays_orig_tbl-play_id to pg
-- requires: schema/music
-- requires: table/music.streaming_plays_orig_tbl

BEGIN;

ALTER TABLE ONLY music.streaming_plays_orig_tbl ALTER COLUMN play_id SET DEFAULT nextval('music.streaming_plays_play_id_seq'::regclass);

COMMIT;
