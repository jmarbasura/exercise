-- Revert id.me:schema/music from pg

BEGIN;

DROP SCHEMA IF EXISTS music;

COMMIT;
