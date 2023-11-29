-- Revert id.me:alter_table_only/lookup.tiers-tiers_pkey from pg

BEGIN;

ALTER TABLE lookup.tiers DROP CONSTRAINT tiers_pkey;

COMMIT;
