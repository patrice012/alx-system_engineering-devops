## Task 1
create user using  `task_1_create_user.sql`
```
cat task_1_create_user.sql | sudo mysql
```
Test db
`mysql -uholberton_user -p -e "SHOW GRANTS FOR 'holberton_user'@'localhost'"`
using `projectcorrection280hbtn` as password

## Task 2
create record db and table
```
cat task_2_create_table.sql | sudo mysql
```

## Task 3
Testing: `mysql -uholberton_user -p -e 'SELECT user, Repl_slave_priv FROM mysql.user'`
using `projectcorrection280hbtn` as paword
