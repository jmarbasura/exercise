-- Deploy id.me:alter_table_only/lookup.tiers-tiers_pkey to pg
-- requires: schema/lookup
-- requires: table/lookup.tiers

BEGIN;

ALTER TABLE ONLY lookup.tiers
    ADD CONSTRAINT tiers_pkey PRIMARY KEY (tier_id);

COMMIT;
