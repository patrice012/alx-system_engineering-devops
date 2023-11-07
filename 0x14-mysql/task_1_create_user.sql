-- Create the MySQL User
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
-- Grant Permissions to Check Replication Status
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
-- flush privileges
FLUSH PRIVILEGES;
-- Show user permissions
SHOW GRANTS FOR 'holberton_user'@'localhost';