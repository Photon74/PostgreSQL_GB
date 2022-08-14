WITH big_video AS (
	SELECT id, size, url, owner_user_id
	FROM video	
)
SELECT big_video.id video_id,
		users.first_name user_first_name,
		users.last_name user_last_name,
		photo.url photo_url,
		big_video.url video_url,
		big_video.size video_size
FROM users
JOIN big_video ON big_video.owner_user_id = users.id
JOIN photo ON photo.id = users.main_photo_id
ORDER BY big_video.size DESC
LIMIT 10;