-- Revert id.me:alter_table_only/music.user_addresses-fk_users_user_id from pg

BEGIN;

ALTER TABLE music.user_addresses DROP CONSTRAINT fk_users_user_id;

COMMIT;
