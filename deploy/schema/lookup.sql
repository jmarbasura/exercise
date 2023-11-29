-- Deploy id.me:schema/lookup to pg

BEGIN;

CREATE SCHEMA lookup;


ALTER SCHEMA lookup OWNER TO postgres;

COMMIT;
