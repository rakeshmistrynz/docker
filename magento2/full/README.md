
# Magento 2 beta

If you want to try Magento 2 easily, just adapt this docker commands with your custom values :

```bash
docker run --name magento2_db -d -e MYSQL_ROOT_PASSWORD="rootpassword" -e MYSQL_DATABASE="magento2" -e MYSQL_USER="magento2" -e MYSQL_PASSWORD="yourpassword" mysql
docker run --name magento2_web -d -p 80 --link=magento2_db:database_name chadrien/magento2:0.42.0-beta1
docker port magento2_web
```

Then you should be able to install on <code>http://127.0.0.1:PORT</code>

Don't pay attention to the error message at the end, it's still a beta version ;)
