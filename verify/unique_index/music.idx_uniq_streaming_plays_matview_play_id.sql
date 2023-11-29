-- Verify id.me:unique_index/music.idx_uniq_streaming_plays_matview_play_id on pg

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
                           AND tablename = 'streaming_plays_matview' 
                           AND indexname = 'idx_uniq_streaming_plays_matview_play_id'
                        )
         );
END $$;
