-- Revert id.me:schema/lookup from pg

BEGIN;

DROP SCHEMA IF EXISTS lookup;

COMMIT;
