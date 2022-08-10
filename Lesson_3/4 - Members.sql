ALTER TABLE communities ADD COLUMN members INT[];

UPDATE communities SET members = ARRAY(
	SELECT array_agg(user_id) FROM (
		SELECT user_id FROM communities_users WHERE community_id = 3) AS arr)
WHERE id = 3;