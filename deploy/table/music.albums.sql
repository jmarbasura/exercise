-- Deploy id.me:table/music.albums to pg
-- requires: schema/music

BEGIN;

CREATE TABLE music.albums (
    album_id integer DEFAULT nextval('music.albums_album_id_seq'::regclass) NOT NULL,
    album text NOT NULL,
    artist_name text NOT NULL,
    release_date date NOT NULL,
    genres text[] DEFAULT '{}'::text[] NOT NULL,
    average_rating numeric(3,2),
    number_of_ratings integer,
    number_of_reviews integer,
    descriptors text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE music.albums OWNER TO postgres;

COMMIT;
