-- Deploy id.me:type/public.user_tier to pg

BEGIN;

CREATE TYPE public.user_tier AS ENUM (
    'free',
    'premium'
);


ALTER TYPE public.user_tier OWNER TO jason;

COMMIT;
