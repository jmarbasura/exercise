-- Verify id.me:alter_table_only/music.user_addresses-fk_users_user_id on pg

DO $$
BEGIN

  ASSERT (select exists (
                         SELECT co.oid, nsp.nspname, co.conname, co.contype, co.condeferrable, co.condeferred, co.conrelid
                         FROM pg_catalog.pg_constraint co
                              INNER JOIN pg_catalog.pg_class cl
                                         ON cl.oid = co.conrelid
                              INNER JOIN pg_catalog.pg_namespace nsp
                                         ON nsp.oid = connamespace
                         WHERE nsp.nspname = 'music'
                               AND cl.relname = 'user_addresses'
                               AND co.conname = 'fk_users_user_id'
                        )
         );
END $$;
