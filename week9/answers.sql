DROP SCHEMA IF EXISTS social;
CREATE SCHEMA social;
USE social;

CREATE TABLE users (
	user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   email VARCHAR(255),
   created_on DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sessions (
	session_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   user_id INT UNSIGNED NOT NULL,
   created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
   updated_on DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (user_id) REFERENCES users(user_id)
   	ON UPDATE CASCADE
   	ON DELETE CASCADE
);

CREATE TABLE friends (
	user_friend_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	friend_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (friend_id) REFERENCES users(user_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE posts (
	post_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_on DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	content MEDIUMTEXT
);

CREATE TABLE notifications (
	notification_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	post_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE OR REPLACE VIEW notification_posts AS (
	SELECT
		notif.user_id,
		users.first_name,
		users.last_name,
		posts.post_id,
		posts.content
	FROM
		posts
		INNER JOIN notifications AS notif
			ON posts.post_id = notif.post_id
		INNER JOIN users
			ON posts.user_id = users.user_id
);


DELIMITER $$
CREATE PROCEDURE new_user_notif(IN new_id INT UNSIGNED, IN new_fname VARCHAR(255), IN new_lname VARCHAR(255))
BEGIN
	
	DECLARE id INT UNSIGNED;
	
	DECLARE end_of_cursor TINYINT DEFAULT FALSE;
	DECLARE user_cursor CURSOR FOR
		SELECT user_id FROM users WHERE user_id != new_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET end_of_cursor = TRUE;
		
	INSERT INTO posts
		(user_id, content)
	VALUES
		(new_id, CONCAT(new_fname, ' ', new_lname, ' just joined!'));
		
	OPEN user_cursor;
	user_loop : LOOP
	
		FETCH user_cursor INTO id;
		IF end_of_cursor THEN
			LEAVE user_loop;
		END IF;
		
		INSERT INTO notifications
			(user_id, post_id)
		VALUES
			(id, (SELECT MAX(post_id) FROM posts));
		
	END LOOP user_loop;
	CLOSE user_cursor;

END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER new_user
	AFTER INSERT ON users
	FOR EACH ROW
BEGIN
	CALL new_user_notif(NEW.user_id, NEW.first_name, NEW.last_name);
END$$
DELIMITER ;


CREATE EVENT clear_session
ON SCHEDULE EVERY 10 SECOND
DO
	DELETE FROM
		sessions
	WHERE
		HOUR(TIMEDIFF(CURRENT_TIMESTAMP, updated_on)) > 2;
		

DELIMITER $$
CREATE PROCEDURE add_post(IN user_id INT UNSIGNED, content MEDIUMTEXT)
BEGIN

	DECLARE new_post_id INT UNSIGNED;
	DECLARE friends_id INT UNSIGNED;
	DECLARE end_of_cursor TINYINT DEFAULT FALSE;
	DECLARE friends_cursor CURSOR FOR
		SELECT 
			friend_id 
		FROM 
			friends 
		WHERE
			friends.user_id = user_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET end_of_cursor = TRUE;

	INSERT INTO posts
		(posts.user_id, posts.content)
	VALUES
		(user_id, content);
	SET @new_post_id = LAST_INSERT_ID();
		
	OPEN friends_cursor;
	friends_loop : LOOP
	
		FETCH friends_cursor INTO friends_id;
		IF end_of_cursor THEN
			LEAVE friends_loop;
		END IF;
		
		INSERT INTO notifications
			(user_id, post_id)
		VALUES
			(friends_id, @new_post_id);
	
	END LOOP friends_loop;
	CLOSE friends_cursor;

END$$
DELIMITER ;
