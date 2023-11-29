-- Verify id.me:schema/lookup on pg

DO $$
BEGIN

  ASSERT (select exists (select * from pg_namespace where nspname = 'lookup'));

END $$;
