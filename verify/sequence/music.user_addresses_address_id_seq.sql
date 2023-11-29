-- Verify id.me:sequence/music.user_addresses_address_id_seq on pg

DO $$
BEGIN

  ASSERT (SELECT EXISTS (
                         SELECT  
                           n.nspname AS schema_name, 
                           relname AS sequence_name 
                         FROM pg_class AS c 
                          INNER JOIN pg_sequence AS s ON c.oid = s.seqrelid 
                          INNER JOIN pg_namespace AS n ON c.relnamespace = n.oid 
                         WHERE c.relname = 'game_position_log_hawkeye_v10_audit_audit_id_seq'
                        )
         );
END $$;
