--all tables
begin;
SELECT 'adding created_at and updated_at columns';
ALTER TABLE public.users ADD COLUMN created_at TIMESTAMP, ADD COLUMN updated_at TIMESTAMP;
ALTER TABLE public.users ALTER COLUMN created_at SET DEFAULT now(), ALTER COLUMN updated_at SET DEFAULT now();

ALTER TABLE public.albums ADD COLUMN created_at TIMESTAMP, ADD COLUMN updated_at TIMESTAMP;
ALTER TABLE public.albums ALTER COLUMN created_at SET DEFAULT now(), ALTER COLUMN updated_at SET DEFAULT now();

ALTER TABLE public.streaming_plays ADD COLUMN created_at TIMESTAMP, ADD COLUMN updated_at TIMESTAMP;
ALTER TABLE public.streaming_plays ALTER COLUMN created_at SET DEFAULT now(), ALTER COLUMN updated_at SET DEFAULT now();
commit;

