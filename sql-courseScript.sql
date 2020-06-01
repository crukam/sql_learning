CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR (255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    img_url VARCHAR (255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments(
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE likes (
	user_id INTEGER NOT NULL,
	photo_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows(
	follow_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    create_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follow_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follow_id,followee_id)
    
);

SHOW DATABASES;
DESCRIBE follows;