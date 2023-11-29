-- Verify id.me:type/public.user_tier on pg

DO $$
BEGIN

  ASSERT (
          SELECT EXISTS (

                         SELECT n.nspname as schema_name,
                           pg_catalog.format_type(t.oid, NULL) AS type_name,
                           pg_catalog.obj_description(t.oid, 'pg_type') as description
                         FROM pg_catalog.pg_type t
                              LEFT JOIN pg_catalog.pg_namespace n ON n.oid = t.typnamespace
                         WHERE (t.typrelid = 0 OR (SELECT c.relkind = 'c' FROM pg_catalog.pg_class c WHERE c.oid = t.typrelid))
                           AND NOT EXISTS(SELECT 1 FROM pg_catalog.pg_type el WHERE el.oid = t.typelem AND el.typarray = t.oid)
                               AND n.nspname = 'public'
                               AND pg_catalog.format_type(t.oid, NULL) = 'user_tier'
                           AND pg_catalog.pg_type_is_visible(t.oid)
                         ORDER BY 1, 2
                        )
         );
END $$;
