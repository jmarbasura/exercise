-- Revert id.me:table/public.streaming_plays from pg

BEGIN;

DROP TABLE IF EXISTS public.streaming_plays;

COMMIT;
