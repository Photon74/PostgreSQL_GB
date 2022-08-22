CREATE OR REPLACE FUNCTION  who_wrote_most_messages(user_id INTEGER)
RETURNS INTEGER AS
$$
	SELECT from_user_id
	FROM messages
	WHERE to_user_id = user_id
	GROUP BY from_user_id
	ORDER BY COUNT(from_user_id) DESC
	LIMIT 1;
$$
LANGUAGE SQL;

SELECT who_wrote_most_messages(2);