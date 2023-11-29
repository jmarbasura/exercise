
begin;
CREATE MATERIALIZED VIEW music.streaming_plays_matview as SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at from music.streaming_plays with no data;
CREATE UNIQUE INDEX idx_uniq_streaming_plays_matview_play_id on music.streaming_plays_matview USING btree(play_id);
refresh materialized view music.streaming_plays_matview;
--refresh materialized view concurrently music.streaming_plays_matview;
commit;

--ALTER INDEX uniq_streaming_plays RENAME TO uniq_streaming_plays_orig; 
--ALTER INDEX pk_streaming_plays_play_id RENAME TO pk_streaming_plays_play_id_orig;

