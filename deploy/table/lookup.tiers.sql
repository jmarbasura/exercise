-- Deploy id.me:table/lookup.tiers to pg
-- requires: schema/lookup

BEGIN;

CREATE TABLE lookup.tiers (
    tier_id integer NOT NULL,
    tier_name text NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE lookup.tiers OWNER TO postgres;

COMMIT;
