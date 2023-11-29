
--albums table
begin;
SELECT 'updating album_id data to be int entirely...';
UPDATE public.albums SET album_id = regexp_replace(album_id, '^A', '');
ALTER TABLE public.albums ALTER COLUMN album_id TYPE int USING album_id::int;

SELECT 'updating release_date to use date data type...';
ALTER TABLE public.albums ALTER COLUMN release_date TYPE date USING release_date::date;

commit;

