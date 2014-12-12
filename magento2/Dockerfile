FROM php:5.5-apache
MAINTAINER chadrien <chadrien@chadrien.fr>

ENV COMPOSER_VERSION 1.0.0-alpha9
RUN curl -sSL https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar -o /usr/bin/composer \
    && chmod +x /usr/bin/composer \
    && apt-get update && apt-get install -y zlib1g-dev git && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip \
    && apt-get purge -y --auto-remove zlib1g-dev

RUN requirements="libpng12-dev libmcrypt-dev libcurl3-dev libxml2-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install soap \
    && requirementsToRemove="libpng12-dev libcurl3-dev libxml2-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

ENV MAGENTO_VERSION 0.1.0-alpha107
RUN curl -sSL https://github.com/magento/magento2/archive/${MAGENTO_VERSION}.tar.gz -o magento2.tar.gz \
    && tar -xzf magento2.tar.gz -C /var/www --strip 1 \
    && rm magento2.tar.gz \
    && cd /var/www \
    && rm -rf html && ln -s /var/www/pub html && ln -s /var/www/setup html/ \
    && composer -n --no-dev install \
    && cd setup \
    && composer -n --no-dev install

RUN chown -R www-data:www-data /var/www
RUN a2enmod rewrite

WORKDIR /var/www/html
