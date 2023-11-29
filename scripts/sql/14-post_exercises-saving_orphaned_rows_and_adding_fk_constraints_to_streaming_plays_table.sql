
begin;
CREATE TABLE music.orphaned_album_ids_from_streaming_plays AS select * from music.streaming_plays limit 0;

WITH deleted_rows AS (
    DELETE FROM music.streaming_plays t
    WHERE  album_id IN(101428,100266,103116)

    RETURNING t.*
)   
INSERT INTO music.orphaned_album_ids_from_streaming_plays 
SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at FROM deleted_rows;
    
ALTER TABLE music.streaming_plays add constraint fk_albums_albums_album_id FOREIGN KEY (album_id) REFERENCES music.albums(album_id);

CREATE TABLE music.orphaned_user_ids_from_streaming_plays AS select * from music.streaming_plays limit 0;

WITH deleted_rows AS (
    DELETE FROM music.streaming_plays t
    WHERE  user_id=1000

    RETURNING t.*
)   
INSERT INTO music.orphaned_user_ids_from_streaming_plays 
SELECT play_id, user_id, album_id, track_number, play_timestamp, created_at, updated_at FROM deleted_rows;
    
ALTER TABLE music.streaming_plays add constraint fk_users_user_id FOREIGN KEY (user_id) REFERENCES music.users(user_id);
commit;

