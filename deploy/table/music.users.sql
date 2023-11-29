-- Deploy id.me:table/music.users to pg
-- requires: schema/music

BEGIN;

CREATE TABLE music.users (
    user_id integer DEFAULT nextval('music.users_user_id_seq'::regclass) NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    tier text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE music.users OWNER TO postgres;

COMMIT;
