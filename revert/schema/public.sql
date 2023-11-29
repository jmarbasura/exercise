-- Revert id.me:schema-public from pg

BEGIN;

DROP SCHEMA IF EXISTS public;

COMMIT;
