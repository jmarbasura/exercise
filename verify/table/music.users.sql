-- Verify id.me:table/music.users on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='music' and tablename='users'));

END $$;
