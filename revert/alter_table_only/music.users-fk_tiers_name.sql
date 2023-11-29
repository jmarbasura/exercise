-- Revert id.me:alter_table_only/music.users-fk_tiers_name from pg

BEGIN;

ALTER TABLE music.users DROP CONSTRAINT fk_tiers_name;

COMMIT;
