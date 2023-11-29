-- Revert id.me:type/public.user_tier from pg

BEGIN;

DROP TYPE IF EXISTS public.user_tier;

COMMIT;
