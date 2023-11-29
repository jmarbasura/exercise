-- Verify id.me:index/music.streaming_plays_y2024m02_play_timestamp_idx on pg

DO $$
BEGIN

  ASSERT (select exists (
                         SELECT
                           schemaname, 
                           tablename, 
                           indexname, 
                           indexdef 
                         FROM pg_indexes
                         WHERE schemaname = 'music' 
                           AND tablename = 'streaming_plays_y2024m02' 
                           AND indexname = 'streaming_plays_y2024m02_play_timestamp_idx'
                        )
         );
END $$;
