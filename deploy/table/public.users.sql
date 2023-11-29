-- Deploy id.me:table/public.users to pg
-- requires: schema/public

BEGIN;

CREATE TABLE public.users (
    user_id character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    street_address character varying(255),
    city character varying(255),
    state character(2),
    country character varying(255),
    tier public.user_tier NOT NULL
);


ALTER TABLE public.users OWNER TO jason;

COMMIT;
