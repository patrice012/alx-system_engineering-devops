-- Create db if not exists'
CREATE DATABASE IF NOT EXISTS tyrell_corp;
-- Select the current db;
USE tyrell_corp;
-- Create table
CREATE TABLE IF NOT EXISTS nexus6 (id  INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255));
-- Create a record
INSERT INTO nexus6 (name) VALUES ('Leon');
-- Set user permission
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
-- Flush privileges
FLUSH PRIVILEGES;
-- test
USE tyrell_corp;
SELECT * FROM nexus6;