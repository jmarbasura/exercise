-- Deploy id.me:alter_table_only/music.user_addresses-fk_users_user_id to pg
-- requires: schema/music
-- requires: table/music.user_addresses

BEGIN;

ALTER TABLE ONLY music.user_addresses
    ADD CONSTRAINT fk_users_user_id FOREIGN KEY (user_id) REFERENCES music.users(user_id);

COMMIT;
