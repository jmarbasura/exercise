-- Verify id.me:alter_table_only/music.streaming_plays-music.streaming_plays_y2023m12 on pg

DO $$
BEGIN

  ASSERT (select exists (                                   
                         SELECT c.oid::pg_catalog.regclass, c.relkind, inhdetachpending, inhrelid, inhparent, inhseqno, inhdetachpending, pg_catalog.pg_get_expr(c.relpartbound, c.oid)
                         FROM pg_catalog.pg_class c, pg_catalog.pg_inherits i
                         WHERE c.oid = i.inhrelid 
                           AND i.inhparent IN (select oid from pg_class where relnamespace::regnamespace::text='music' and relname='streaming_plays')
                           AND i.inhrelid IN (select oid from pg_class where relnamespace::regnamespace::text='music' and relname='music.streaming_plays_y2023m12')

                         ORDER BY pg_catalog.pg_get_expr(c.relpartbound, c.oid) = 'DEFAULT', c.oid::pg_catalog.regclass::pg_catalog.text
                        ));
END $$;
