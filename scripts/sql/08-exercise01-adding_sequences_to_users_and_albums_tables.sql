
begin;
SELECT 'adding user_id_seq to users ...';
CREATE SEQUENCE music.users_user_id_seq;
ALTER TABLE music.users ALTER COLUMN user_id SET DEFAULT nextval('music.users_user_id_seq');
SELECT setval('music.users_user_id_seq', (SELECT max(user_id) + 1 from music.users), false);

--INSERT INTO music.users (first_name, last_name, email, tier, created_at, updated_at) values('Jason', 'Martinez', 'jason.martinez@id.me', 'free', now(), now());
SELECT 'adding album_id_seq to albums ...';
CREATE SEQUENCE music.albums_album_id_seq;

ALTER TABLE music.albums ALTER COLUMN album_id SET DEFAULT nextval('music.albums_album_id_seq');
SELECT setval('music.albums_album_id_seq', (SELECT max(album_id) + 1  from music.albums), false);

ALTER TABLE music.streaming_plays ALTER COLUMN created_at SET DEFAULT now(), ALTER COLUMN updated_at SET DEFAULT now();

commit;

