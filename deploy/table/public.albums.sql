-- Deploy id.me:table/public.albums to pg
-- requires: schema/public

BEGIN;

CREATE TABLE public.albums (
    album_id character varying(255),
    album character varying(255),
    artist_name character varying(255),
    release_date character varying(255),
    genres character varying(255),
    average_rating numeric(3,2),
    number_of_ratings integer,
    number_of_reviews integer,
    "album_id	album	artist_name	release_date	genres	average_rating	n" character varying(128),
    descriptors character varying(128)
);


ALTER TABLE public.albums OWNER TO postgres;

COMMIT;
