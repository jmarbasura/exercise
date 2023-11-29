-- Deploy id.me:table/music.streaming_plays_y2024m01 to pg
-- requires: schema/music

BEGIN;

CREATE TABLE music.streaming_plays_y2024m01 (
    play_id integer DEFAULT nextval('music.streaming_plays_play_id_seq'::regclass) NOT NULL,
    user_id integer NOT NULL,
    album_id integer NOT NULL,
    track_number integer NOT NULL,
    play_timestamp timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE music.streaming_plays_y2024m01 OWNER TO postgres;

COMMIT;
