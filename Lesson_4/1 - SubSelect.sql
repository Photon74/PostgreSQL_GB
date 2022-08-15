SELECT
	videos.id video_id,
	first_name,
	last_name,
	photos.url photo_url,
	videos.url video_url,
	videos.size video_size
FROM users,
	(SELECT id, url, size, owner_user_id FROM video) AS videos,
	(SELECT id, url FROM photo) AS photos
WHERE photos.id = users.main_photo_id
	AND videos.owner_user_id = users.id
ORDER by videos.size DESC
LIMIT 10;