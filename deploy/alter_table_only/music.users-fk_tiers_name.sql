-- Deploy id.me:alter_table_only/music.users-fk_tiers_name to pg
-- requires: schema/music
-- requires: table/music.users

BEGIN;

ALTER TABLE ONLY music.users
    ADD CONSTRAINT fk_tiers_name FOREIGN KEY (tier) REFERENCES lookup.tiers(tier_name);

COMMIT;
