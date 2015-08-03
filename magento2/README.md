# Supported tags and respective Dockerfile links

* `5.6-apache` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/master/magento2/platform/5.6/apache/Dockerfile)
* `5.5-apache` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/master/magento2/platform/5.5/apache/Dockerfile)
* `5.6-apache-full-1.0.0-beta` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/113bdba070389fa2d56ce8d32bd5827b226540e8/magento2/full/5.6/apache/Dockerfile)
* `5.5-apache-full-1.0.0-beta` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/113bdba070389fa2d56ce8d32bd5827b226540e8/magento2/full/5.5/apache/Dockerfile)

# Magento 2

Welcome to Magento 2 installation! We're glad you chose to install Magento 2, a cutting edge, feature-rich eCommerce solution that gets results.

The installation instructions that used to be here are now published on our GitHub site. Use the information on this page to get started or go directly to the guide.

[![Magento 2 logo](https://wiki.magento.com/download/attachments/2952491/MAGE2DOC?version=1&modificationDate=1378339878000&api=v2)](https://github.com/magento/magento2)

# How to use this image

## Platform

First you need to create a new Magento 2 project:

```bash
composer create-project -n magento/product-community-edition magento2 1.0.0-beta1 && cd magento2
```
Then you add a `docker-compose.yml` file with your custom values:

```
web:
  image: chadrien/magento2:5.6-apache
  links:
    - db
  ports:
    - 80
  volumes:
    - ".:/var/www"
db:
  image: mysql
  environment:
    MYSQL_ROOT_PASSWORD: rootpassword
    MYSQL_DATABASE: magento2
    MYSQL_USER: magento2
    MYSQL_PASSWORD: mySQLpassword
```

Now you can start your containers:

```
docker-compose up -d
docker-compose port web 80
```

Then open your browser to `http://127.0.0.1:PORT` to start Magento2 setup wizard.

You are now ready to develop your Magento 2 modules in `app/code` and your changes will be visible in Docker.

## Full

If you just want to try Magento 2 easily, just adapt this docker commands with your custom values:

```bash
docker run --name magento2_db -d -e MYSQL_ROOT_PASSWORD="rootpassword" -e MYSQL_DATABASE="magento2" -e MYSQL_USER="magento2" -e MYSQL_PASSWORD="yourpassword" mysql
docker run --name magento2_web -d -p 80 --link=magento2_db chadrien/magento2:5.6-apache-full-1.0.0-beta
docker port magento2_web
```

Then you should be able to install on `http://127.0.0.1:PORT`
