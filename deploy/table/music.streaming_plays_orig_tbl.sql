-- Deploy id.me:table/music.streaming_plays_orig_tbl to pg
-- requires: schema/music

BEGIN;

CREATE TABLE music.streaming_plays_orig_tbl (
    user_id integer NOT NULL,
    album_id integer NOT NULL,
    track_number integer NOT NULL,
    play_timestamp timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    play_id integer NOT NULL
);


ALTER TABLE music.streaming_plays_orig_tbl OWNER TO postgres;

COMMIT;
