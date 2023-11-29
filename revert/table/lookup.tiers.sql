-- Revert id.me:table/lookup.tiers from pg

BEGIN;

DROP TABLE IF EXISTS lookup.tiers;

COMMIT;
