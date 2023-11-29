-- Deploy id.me:alter_table_only/music.user_addresses-address_id to pg
-- requires: schema/music
-- requires: table/music.user_addresses

BEGIN;

ALTER TABLE ONLY music.user_addresses ALTER COLUMN address_id SET DEFAULT nextval('music.user_addresses_address_id_seq'::regclass);

COMMIT;
