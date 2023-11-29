-- Verify id.me:schema-public on pg

DO $$
BEGIN

  ASSERT (select exists (select * from pg_namespace where nspname = 'public'));

END $$;
