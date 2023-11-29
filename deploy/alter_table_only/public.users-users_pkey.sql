-- Deploy id.me:alter_table_only/public.users-users_pkey to pg
-- requires: schema/public
-- requires: table/public.users

BEGIN;

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);

COMMIT;
