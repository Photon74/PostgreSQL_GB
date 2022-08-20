SELECT
	video.id video_id,
	users.first_name user_first_name,
	users.last_name user_last_name,
	photo.url photo_url,
	video.url video_url,
	video.size video_size
FROM users
JOIN video ON video.owner_user_id = users.id
LEFT JOIN photo ON photo.id = users.main_photo_id
ORDER BY video.size DESC
LIMIT 10;