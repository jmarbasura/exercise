-- Verify id.me:alter_table_only/music.streaming_plays_y2023m09-streaming_plays_y2023m09_pkey on pg

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
                               AND cl.relname = 'streaming_plays_y2023m09'
                               AND co.conname = 'streaming_plays_y2023m09_pkey'
                        )
         );
END $$;
