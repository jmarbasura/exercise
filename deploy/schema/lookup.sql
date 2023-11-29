-- Deploy id.me:schema/lookup to pg

BEGIN;

CREATE SCHEMA lookup;


ALTER SCHEMA lookup OWNER TO jason;

COMMIT;
