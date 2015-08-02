# Magento 2 beta for developers

Requirements: Composer and Docker Compose on your machine

First you need to create a new Magento 2 project:

```bash
composer create-project -n magento/product-community-edition magento2 1.0.0-beta1 && cd magento2
```
Then you add a `docker-compose.yml` file with your custom values:

```yaml
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

```shell
docker-compose up -d
docker-compose port web 80
```

Then open your browser to `http://127.0.0.1:PORT` to start Magento2 setup wizard.

You are now ready to develop your Magento modules in `app/code` and your changes will be visible in Docker.
