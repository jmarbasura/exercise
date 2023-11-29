-- Revert id.me:alter_table_only/music.user_addresses-address_id from pg

BEGIN;

ALTER TABLE ONLY music.user_addresses ALTER COLUMN address_id DROP DEFAULT;

COMMIT;
