-- Deploy id.me:sequence/music.streaming_plays_play_id_seq to pg
-- requires: schema/music

BEGIN;

CREATE SEQUENCE music.streaming_plays_play_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE music.streaming_plays_play_id_seq OWNER TO postgres;

COMMIT;
