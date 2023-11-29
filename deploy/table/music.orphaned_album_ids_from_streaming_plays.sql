-- Deploy id.me:table/music.orphaned_album_ids_from_streaming_plays to pg
-- requires: schema/music

BEGIN;

CREATE TABLE music.orphaned_album_ids_from_streaming_plays (
    play_id integer,
    user_id integer,
    album_id integer,
    track_number integer,
    play_timestamp timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE music.orphaned_album_ids_from_streaming_plays OWNER TO postgres;

COMMIT;
