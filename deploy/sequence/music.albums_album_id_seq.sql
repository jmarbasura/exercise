-- Deploy id.me:sequence/music.albums_album_id_seq to pg
-- requires: schema/music

BEGIN;

CREATE SEQUENCE music.albums_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE music.albums_album_id_seq OWNER TO jason;



COMMIT;
