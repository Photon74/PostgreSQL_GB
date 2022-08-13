CREATE TYPE contacts AS (phone VARCHAR(20), email VARCHAR(50));

ALTER TABLE users ADD COLUMN user_contacts contacts;

UPDATE users SET user_contacts = (phone, email);

UPDATE users SET user_contacts.email = 'test@somemail.ru' WHERE id = 21;

SELECT id, email, user_contacts FROM users WHERE id = 21;