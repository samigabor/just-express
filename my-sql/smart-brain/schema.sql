-- CREATE DATABASE smart_brain;
-- show databases;
-- USE smart_brain;
-- CREATE TABLE users(
--     id INT(100) PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100),
--     email VARCHAR(100) UNIQUE NOT NULL,
--     entries INT(100) DEFAULT 0,
--     joined TIMESTAMP DEFAULT NOW()
-- );
-- DESC users;
-- CREATE TABLE logins(
--     id INT(100) PRIMARY KEY AUTO_INCREMENT,
--     hash VARCHAR(100) NOT NULL,
--     email INT(100) UNIQUE NOT NULL
-- );
-- DESC logins;
-- SELECT * FROM users;
-- SELECT * FROM logins;

-- INSERT INTO users(name, email) VALUES ('Sammy', 'sammy@gmail.com');
-- INSERT INTO users(name, email) VALUES ('Johnny', 'johnny@gmail.com');
-- ALTER TABLE logins MODIFY email VARCHAR(100) NOT NULL;
-- ALTER TABLE logins MODIFY hash VARCHAR(100) NOT NULL;
-- INSERT INTO users(name, email) VALUES ('Sammy', 'sammy@gmail.com');
-- INSERT INTO logins(hash, email) VALUES ('123', 'johnny@gmail.com');

-- INSERT INTO users(name, email) 
-- VALUES 
--     ('John', 'john@gmail.com'),
--     ('Chris', 'chris@gmail.com'),
--     ('Debra', 'd@gmail.com');
-- INSERT INTO logins(hash, email) 
-- VALUES 
--     ('111', 'john@gmail.com'),
--     ('222', 'chris@gmail.com'),
--     ('333', 'd@gmail.com');


-- INSERT INTO users(name, email) VALUES ('Sammy', 'sammy@gmail.com');