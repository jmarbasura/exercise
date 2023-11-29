-- Verify id.me:table/music.orphaned_user_ids_from_streaming_plays on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, tablename from pg_tables where schemaname='music' and tablename='orphaned_user_ids_from_streaming_plays'));

END $$;
