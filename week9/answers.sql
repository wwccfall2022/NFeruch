-- Create your tables, views, functions and procedures here!
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
);

CREATE TABLE friends (
	user_friend_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	friend_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (friend_id) REFERENCES users(user_id)
);

CREATE TABLE posts (
	post_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	created_on DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_on DATETIME DEFAULT CURRENT_TIMESTAMP,
	content MEDIUMTEXT,
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE notifications (
	notification_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	user_id INT UNSIGNED NOT NULL,
	post_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

CREATE OR REPLACE VIEW notification_posts AS (
	SELECT
		notif.user_id,
		users.first_name,
		users.last_name,
		posts.post_id,
		posts.content
	FROM
		users
		INNER JOIN posts
			ON users.user_id = posts.user_id
		INNER JOIN notifications AS notif
			ON users.user_id = notif.user_id
);
