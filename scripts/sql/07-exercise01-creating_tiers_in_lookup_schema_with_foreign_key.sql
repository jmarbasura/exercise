
--lookup schema
begin;
SELECT 'creating lookup schema...';
CREATE SCHEMA IF NOT EXISTS lookup;

SELECT 'creating lookup.tiers ...';
CREATE TABLE lookup.tiers (tier_id int not null, tier_name text not null, description text, created_at timestamp, updated_at timestamp, PRIMARY KEY(tier_id));
CREATE UNIQUE INDEX idx_tiers_name ON lookup.tiers USING btree(tier_name);

INSERT INTO lookup.tiers (tier_id, tier_name) VALUES (1, 'free');
INSERT INTO lookup.tiers (tier_id, tier_name) VALUES (2, 'premium');

ALTER TABLE music.users alter column tier type text;
DROP TYPE public.user_tier;
ALTER TABLE music.users add constraint fk_tiers_name FOREIGN KEY (tier) REFERENCES lookup.tiers(tier_name);
commit;

