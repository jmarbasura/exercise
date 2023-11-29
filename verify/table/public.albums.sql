-- Verify id.me:table/public.albums on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='public' and tablename='albums'));

END $$;
