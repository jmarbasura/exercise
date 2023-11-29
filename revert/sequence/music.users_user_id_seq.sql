-- Revert id.me:sequence/music.users_user_id_seq from pg

BEGIN;

DROP SEQUENCE IF EXISTS music.users_user_id_seq;

COMMIT;
