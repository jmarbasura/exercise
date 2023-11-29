-- Verify id.me:alter_table_only/music.user_addresses-address_id on pg

DO $$
BEGIN

  ASSERT (select exists (select classid, objid, objsubid, refclassid, refobjid, refobjsubid, deptype from pg_depend where objid IN (SELECT oid FROM pg_class WHERE relname = 'address_id' AND relkind = 'S')));

END $$;
