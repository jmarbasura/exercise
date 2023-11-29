-- Deploy id.me:alter_table_only/music.users-pk_users_user_id to pg
-- requires: schema/music
-- requires: table/music.users

BEGIN;

ALTER TABLE ONLY music.users
    ADD CONSTRAINT pk_users_user_id PRIMARY KEY (user_id);

COMMIT;
