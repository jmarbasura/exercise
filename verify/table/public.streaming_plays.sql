-- Verify id.me:table/public.streaming_plays on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='public' and tablename='streaming_plays'));

END $$;
