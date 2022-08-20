-- Задание 1

CREATE ROLE testers;
CREATE ROLE analysts;

CREATE ROLE serovf LOGIN;
CREATE ROLE belovr LOGIN;

GRANT analysts TO serovf;
GRANT testers TO belovr;

ALTER ROLE belovr WITH PASSWORD 'belov';
ALTER ROLE serovf WITH PASSWORD 'serov';

GRANT SELECT ON ALL TABLES IN SCHEMA public TO analysts;

GRANT ALL ON ALL TABLES IN SCHEMA public TO testers;
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO testers;

psql -U belovr -d vk -h 127.0.0.1
UPDATE messages SET body = 'New message' WHERE id = 1;

psql -U serovf -d vk -h 127.0.0.1
UPDATE messages SET body = 'New message - 2' WHERE id = 2;
ERROR:  permission denied for table messages


-- Задание 2

create extension "citext";


-- Задание 3

CREATE TABLE profiles (
	user_id INT NOT NULL,
	main_photo_id INT,
	created_at TIMESTAMP,
	user_contacts CONTACTS
);

ALTER TABLE profiles 
    ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users (id);
    
ALTER TABLE profiles 
    ADD CONSTRAINT profiles_main_photo_id_fk
    FOREIGN KEY (main_photo_id)
    REFERENCES photo (id);

INSERT INTO profiles (
	user_id,
	main_photo_id,
	user_contacts,
	created_at)
SELECT
	id,
	main_photo_id,
	user_contacts,
	created_at
FROM users;

ALTER TABLE users 
    DROP COLUMN main_photo_id,
    DROP COLUMN user_contacts,
    DROP COLUMN created_at;