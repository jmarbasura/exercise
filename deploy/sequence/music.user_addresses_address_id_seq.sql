-- Deploy id.me:sequence/music.user_addresses_address_id_seq to pg
-- requires: schema/music

BEGIN;

CREATE SEQUENCE music.user_addresses_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE music.user_addresses_address_id_seq OWNER TO postgres;

ALTER SEQUENCE music.user_addresses_address_id_seq OWNED BY music.user_addresses.address_id;

COMMIT;
