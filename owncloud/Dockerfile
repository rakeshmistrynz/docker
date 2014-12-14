FROM php:5.6-apache
MAINTAINER chadrien <chadrien@chadrien.fr>

RUN requirements="libpng12-dev libssl-dev libicu-dev libicu52 g++ zlib1g-dev libgmp3-dev libbz2-dev libmcrypt4 libmcrypt-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && docker-php-ext-install gd \
    && docker-php-ext-install ftp \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-ext-install gmp \
    && docker-php-ext-install bz2 \
    && docker-php-ext-install mysql \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mcrypt \
    && rm /usr/include/gmp.h \
    && requirementsToRemove="libpng12-dev libssl-dev libicu-dev g++ zlib1g-dev libgmp3-dev libbz2-dev libmcrypt-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

ENV OWNCLOUD_VERSION 7.0.4

RUN apt-get update && apt-get install -y bzip2 && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2 -o owncloud.tar.bz2 \
    && tar -xjf owncloud.tar.bz2 -C /var/www/html --strip 1 \
    && rm owncloud.tar.bz2 \
    && apt-get purge -y --auto-remove bzip2

RUN chown -R www-data:www-data /var/www/html

RUN a2enmod rewrite
