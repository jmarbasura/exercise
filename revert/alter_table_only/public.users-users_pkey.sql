-- Revert id.me:alter_table_only/public.users-users_pkey from pg

BEGIN;

ALTER TABLE public.users DROP CONSTRAINT users_pkey;

COMMIT;
