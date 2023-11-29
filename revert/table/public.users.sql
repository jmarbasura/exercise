-- Revert id.me:table/public.users from pg

BEGIN;

DROP TABLE IF EXISTS public.users;

COMMIT;
