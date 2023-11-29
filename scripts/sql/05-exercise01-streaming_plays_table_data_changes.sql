
--streaming_plays table
begin;

ALTER TABLE public.streaming_plays ALTER COLUMN user_id TYPE int USING user_id::integer;
commit;

----running this outside of a transaction purposefully
CREATE UNIQUE INDEX CONCURRENTLY idx_uniq_streaming_plays_album_track_user_timestamp ON public.streaming_plays USING btree(album_id, track_number, user_id, play_timestamp);

begin;
ALTER TABLE public.streaming_plays add constraint uniq_streaming_plays unique USING index idx_uniq_streaming_plays_album_track_user_timestamp;
ALTER TABLE public.streaming_plays alter column user_id set not null, alter column album_id set not null, alter column track_number set not null;

UPDATE public.streaming_plays SET album_id = regexp_replace(album_id, '^A', '');
ALTER TABLE public.streaming_plays alter column album_id type int using album_id::int;
commit;

