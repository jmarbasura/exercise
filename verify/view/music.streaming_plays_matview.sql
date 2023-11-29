-- Verify id.me:view/music.streaming_plays_matview on pg

DO $$
BEGIN

  ASSERT (select exists (select schemaname, viewname from pg_views where schemaname='music' and viewname='streaming_plays_matview'));

END $$;
