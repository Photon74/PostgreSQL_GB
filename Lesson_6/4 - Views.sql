-- Неизменяемое представление
CREATE VIEW users_withuot_main_photo AS
	SELECT id, first_name, last_name
	FROM users
	LEFT JOIN profiles ON users.id = profiles.user_id
	WHERE main_photo_id IS NULL;
	
SELECT * FROM users_withuot_main_photo LIMIT 3;


-- Изменяемое представление
CREATE VIEW important_messages AS
	SELECT * FROM messages
	WHERE is_important = true;
	
UPDATE important_messages SET body = 'Changed message' WHERE id = '3';