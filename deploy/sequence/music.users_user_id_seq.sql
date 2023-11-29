-- Deploy id.me:sequence/music.users_user_id_seq to pg
-- requires: schema/music

BEGIN;

CREATE SEQUENCE music.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE music.users_user_id_seq OWNER TO postgres;



COMMIT;
