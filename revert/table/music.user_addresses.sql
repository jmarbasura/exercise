-- Revert id.me:table/music.user_addresses from pg

BEGIN;

DROP TABLE IF EXISTS music.user_addresses;

COMMIT;
