-- Verify id.me:table/music.user_addresses on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='music' and tablename='user_addresses'));

END $$;
