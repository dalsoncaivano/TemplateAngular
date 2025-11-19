USE fourtalentsacademy;

drop table users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

INSERT INTO users (email,password)
VALUES ('admin@foursys.com','abc123');