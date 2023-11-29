-- Revert id.me:alter_table_only/music.users-pk_users_user_id from pg

BEGIN;

ALTER TABLE music.users DROP CONSTRAINT pk_users_user_id;

COMMIT;
