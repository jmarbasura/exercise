-- Revert id.me:table/music.orphaned_album_ids_from_streaming_plays from pg

BEGIN;

DROP TABLE IF EXISTS music.orphaned_album_ids_from_streaming_plays;

COMMIT;
