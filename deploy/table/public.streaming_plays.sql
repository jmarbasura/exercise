-- Deploy id.me:table/public.streaming_plays to pg
-- requires: schema/public

BEGIN;

CREATE TABLE public.streaming_plays (
    user_id character varying(255),
    album_id character varying(255),
    track_number integer,
    play_timestamp timestamp without time zone
);


ALTER TABLE public.streaming_plays OWNER TO postgres;

COMMIT;
