
begin;
create table music.user_addresses (address_id serial not null, user_id int not null, street_address text not null, city text not null, state char(2) not null, country text not null);
ALTER TABLE music.user_addresses add constraint fk_users_user_id FOREIGN KEY (user_id) REFERENCES music.users (user_id);

INSERT INTO music.user_addresses (user_id, street_address, city, state, country) select user_id, street_address, city, state, country from music.users;
ALTER TABLE music.users drop column street_address, drop column city, drop column state, drop column country;
commit;

