-- Revert id.me:table/music.users from pg

BEGIN;

DROP TABLE IF EXISTS music.users;

COMMIT;
