-- Revert id.me:unique_index/lookup.idx_tiers_name from pg

BEGIN;

DROP INDEX IF EXISTS lookup.idx_tiers_name;

COMMIT;
