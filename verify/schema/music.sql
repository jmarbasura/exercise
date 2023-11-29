-- Verify id.me:schema/music on pg

DO $$
BEGIN

  ASSERT (select exists (select * from pg_namespace where nspname = 'music'));

END $$;
