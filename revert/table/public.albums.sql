-- Revert id.me:table/public.albums from pg

BEGIN;

DROP TABLE IF EXISTS public.albums;

COMMIT;
