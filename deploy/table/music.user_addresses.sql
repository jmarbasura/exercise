-- Deploy id.me:table/music.user_addresses to pg
-- requires: schema/music

BEGIN;

CREATE TABLE music.user_addresses (
    address_id integer NOT NULL,
    user_id integer NOT NULL,
    street_address text NOT NULL,
    city text NOT NULL,
    state character(2) NOT NULL,
    country text NOT NULL
);


ALTER TABLE music.user_addresses OWNER TO postgres;

COMMIT;
