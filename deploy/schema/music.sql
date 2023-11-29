-- Deploy id.me:schema/music to pg

BEGIN;

CREATE SCHEMA music;


ALTER SCHEMA music OWNER TO jason;

COMMIT;
