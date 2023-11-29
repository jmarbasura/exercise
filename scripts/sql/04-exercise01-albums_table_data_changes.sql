
begin;
SELECT 'updating genres column data to be array...';
UPDATE public.albums SET genres = string_to_array(genres, '|');
ALTER TABLE public.albums ALTER COLUMN genres TYPE text[] USING genres::text[];
ALTER TABLE public.albums ALTER COLUMN genres SET DEFAULT '{}';
ALTER TABLE public.albums ALTER COLUMN genres SET NOT NULL;

alter table public.albums drop column "album_id	album	artist_name	release_date	genres	average_rating	n"; 


commit;

