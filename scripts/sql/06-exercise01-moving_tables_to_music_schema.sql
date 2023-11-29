
--music schema
begin;
SELECT 'creating music schema...';
CREATE SCHEMA IF NOT EXISTS music;

SELECT 'moving tables from public to music schema...';
ALTER TABLE public.albums SET schema music;
ALTER TABLE public.streaming_plays SET schema music;
ALTER TABLE public.users SET schema music;
commit;

