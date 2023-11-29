
begin;
ALTER TABLE music.streaming_plays add column play_id serial;
ALTER TABLE music.streaming_plays add primary key(play_id);

--ALTER TABLE music.streaming_plays add constraint uniq_streaming_plays unique USING index uniq_streaming_plays;
ALTER INDEX music.streaming_plays_pkey RENAME TO pk_streaming_plays_play_id;
commit;

