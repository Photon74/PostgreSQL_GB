CREATE OR REPLACE PROCEDURE set_null_if_not_owner()
LANGUAGE PLPGSQL AS
$$
	DECLARE profiles_row RECORD;
	BEGIN
		FOR profiles_row IN
			SELECT user_id,	main_photo_id, owner_user_id
			FROM profiles
			LEFT JOIN photo ON photo.id = profiles.main_photo_id
			WHERE user_id <> owner_user_id
		LOOP
			UPDATE profiles SET main_photo_id = NULL WHERE user_id = profiles_row.user_id;
		END LOOP;
		COMMIT;
	END;
$$;

CALL set_null_if_not_owner();