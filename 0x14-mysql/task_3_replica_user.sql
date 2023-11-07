-- Create the MySQL User
CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'projectcorrection280hbtn';
-- Grant Permissions
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
-- flush privileges
FLUSH PRIVILEGES;
-- Show user permissions
SHOW GRANTS FOR 'replica_user'@'%';
SHOW GRANTS FOR 'holberton_user'@'localhost';