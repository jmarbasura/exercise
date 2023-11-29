-- Deploy id.me:unique_index/lookup.idx_tiers_name to pg
-- requires: schema/lookup
-- requires: table/lookup.tiers

BEGIN;

CREATE UNIQUE INDEX idx_tiers_name ON lookup.tiers USING btree (tier_name);

COMMIT;
