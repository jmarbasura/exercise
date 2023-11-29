-- Verify id.me:table/public.users on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='public' and tablename='users'));

END $$;
