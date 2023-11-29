-- Verify id.me:table/lookup.tiers on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='lookup' and tablename='tiers'));

END $$;
