-- Verify id.me:table/music.streaming_plays_orig_tbl on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='music' and tablename='streaming_plays_orig_tbl'));

END $$;
