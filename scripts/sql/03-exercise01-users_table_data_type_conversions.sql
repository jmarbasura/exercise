
--users table
begin;
ALTER TABLE public.users ALTER COLUMN user_id TYPE int USING user_id::integer;
ALTER TABLE public.users alter column first_name type text, alter column last_name type text, alter column email type text;

ALTER INDEX public.users_pkey RENAME TO pk_users_user_id;
commit;
