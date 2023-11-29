-- Deploy id.me:view/music.streaming_plays_matview to pg
-- requires: schema/music

BEGIN;

CREATE MATERIALIZED VIEW music.streaming_plays_matview AS
 SELECT streaming_plays_orig_tbl.play_id,
    streaming_plays_orig_tbl.user_id,
    streaming_plays_orig_tbl.album_id,
    streaming_plays_orig_tbl.track_number,
    streaming_plays_orig_tbl.play_timestamp,
    streaming_plays_orig_tbl.created_at,
    streaming_plays_orig_tbl.updated_at
   FROM music.streaming_plays_orig_tbl
  WITH NO DATA;


ALTER TABLE music.streaming_plays_matview OWNER TO postgres;

COMMIT;
