-- Revert id.me:view/music.streaming_plays_matview from pg

BEGIN;

DROP VIEW IF EXISTS music.streaming_plays_matview;

COMMIT;
