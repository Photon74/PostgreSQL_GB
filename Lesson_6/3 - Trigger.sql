CREATE OR REPLACE FUNCTION update_main_photo_id_trigger()
RETURNS TRIGGER AS
$$
	DECLARE is_true BOOLEAN;
	BEGIN
		is_true := EXISTS(SELECT * FROM photo WHERE id = NEW.main_photo_id AND owner_user_id = NEW.user_id);
		IF NOT is_true THEN
			NEW.main_photo_id := NULL;
		END IF;
		RETURN NEW;
	END;
$$
LANGUAGE PLPGSQL;


CREATE TRIGGER check_main_photo_id_on_update BEFORE UPDATE ON profiles
	FOR EACH ROW
	EXECUTE FUNCTION update_main_photo_id_trigger();
	
update profiles set main_photo_id = '7' where user_id = '1'; -- выполнено, т.к. photo.id = 7 принадлежит user = 1
update profiles set main_photo_id = '7' where user_id = '2'; -- не выполнено, т.к. photo.id = 7 не принадлежит user = 2