-- Revert id.me:sequence/music.user_addresses_address_id_seq from pg

BEGIN;

DROP SEQUENCE IF EXISTS music.user_addresses_address_id_seq;

COMMIT;
