# Magento 2 beta

If you just want to try Magento 2 easily, just adapt this docker commands with your custom values:

```bash
docker run --name magento2_db -d -e MYSQL_ROOT_PASSWORD="rootpassword" -e MYSQL_DATABASE="magento2" -e MYSQL_USER="magento2" -e MYSQL_PASSWORD="yourpassword" mysql
docker run --name magento2_web -d -p 80 --link=magento2_db chadrien/magento2:5.6-apache-full-1.0.0-beta
docker port magento2_web
```

Then you should be able to install on `http://127.0.0.1:PORT`
