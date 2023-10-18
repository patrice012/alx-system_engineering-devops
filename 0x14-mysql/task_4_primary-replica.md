# WEB SERVER 01
### Backup default setting
`sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.backup`
### edit the default config file
`sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`
Replace the default config with
```
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
log-error       = /var/log/mysql/error.log

log_bin         = /var/log/mysql/mysql-bin.log
server-id       = 1
binlog_do_db    = tyrell_corp

# By default we only accept connections from localhost
# bind-address  = 127.0.0.1
# Disabling symbolic-links is recommended to prevent assorted security risks
```
Test mysql
```
sudo service mysql restart
sudo service mysql status
```
If no error continue...
### retreve the binary log file name and position on the primary server web 01
`sudo mysql` or `sudo mysql -u roout -p`
COPY the command below output specialy the `file` and `position` column
They are important fot setting up the replica server
`SHOW MASTER STATUS;`
```
mysql> SHOW MASTER STATUS;
+------------------+----------+--------------+------------------+-------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------------+----------+--------------+------------------+-------------------+
| mysql-bin.000001 |      154 |              |                  |                   |
+------------------+----------+--------------+------------------+-------------------+
1 row in set (0.00 sec)
```
`exit`

## STEP TWO ==> setup the replica server

# WEB SERVER 02
### Backup default setting
`sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.backup`
### edit the default config file
`sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`
Replace the default config with
```
[mysqld]
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
log-error       = /var/log/mysql/error.log

server-id       = 2
relay-log       = /var/log/mysql/mysql-relay-bin.log
log_bin         = /var/log/mysql/mysql-bin.log
binlog_do_db    = tyrell_corp

# By default we only accept connections from localhost
# bind-address  = 127.0.0.1
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
```
Test mysql
```
sudo service mysql restart
sudo service mysql status
```
### logging to mysql and configure the replica server using `file` and `Position`
`sudo mysql` or `sudo mysql -u root -p`
```
CHANGE MASTER TO MASTER_HOST='54.161.238.31'
MASTER_USER='replica_user',
MASTER_PASSWORD='projectcorrection280hbtn',
MASTER_LOG_FILE='mysql-bin.000001',
MASTER_LOG_POS=154;
```
Restart the application
`START SLAVE;`
CHECK for error
`SHOW SLAVE STATUS\G;`
- slave IO running && slave SQL running ==> should be yes

logout and aupdate Firewall rules on both servers
`sudo ufw allow from replica_server_ip to any port 3306` or `sudo ufw allow 3306`

##### Test sever

Server 01: mysql -uholberton_user -p
```
mysql> show master status;
+------------------+----------+--------------------+------------------+
| File             | Position | Binlog_Do_DB       | Binlog_Ignore_DB |
+------------------+----------+--------------------+------------------+
| mysql-bin.000009 |      107 | tyrell_corp          |                  |
+------------------+----------+--------------------+------------------+
1 row in set (0.00 sec)
``
