-- Verify id.me:unique_index/lookup.idx_tiers_name on pg

DO $$
BEGIN

  ASSERT (select exists (
                         SELECT
                           schemaname, 
                           tablename, 
                           indexname, 
                           indexdef 
                         FROM pg_indexes
                         WHERE schemaname = 'lookup' 
                           AND tablename = 'tiers' 
                           AND indexname = 'idx_tiers_name'
                        )
         );
END $$;
