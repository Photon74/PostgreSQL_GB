CREATE TEMPORARY TABLE big_video (
	id INT,
	size INT,
	url VARCHAR(250),
	owner_id INT);
	
INSERT INTO big_video
	SELECT id, size, url, owner_user_id
	FROM video
	ORDER BY size DESC
	LIMIT 10;
	
SELECT big_video.id video_id,
		users.first_name user_first_name,
		users.last_name user_last_name,
		photo.url photo_url,
		big_video.url video_url,
		big_video.size video_size
FROM users
JOIN big_video ON big_video.owner_id = users.id
JOIN photo ON photo.id = users.main_photo_id;

		