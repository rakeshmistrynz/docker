FROM php:5.6-apache
MAINTAINER chadrien <chadrien@chadrien.fr>

RUN requirements="libpng12-dev libssl-dev libicu-dev libicu52 g++ zlib1g-dev libgmp3-dev libbz2-dev libmcrypt4 libmcrypt-dev libmagickwand-dev imagemagick libjpeg-dev" \
    && apt-get update && apt-get install -y $requirements && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h \
    && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin/MagickWand-config \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/lib \
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
    && docker-php-ext-install opcache \
    && yes | pecl install imagick \
    && echo extension=imagick.so > /usr/local/etc/php/conf.d/imagick.ini \
    && rm /usr/include/gmp.h /usr/bin/MagickWand-config \
    && requirementsToRemove="libpng12-dev libssl-dev libicu-dev g++ zlib1g-dev libgmp3-dev libbz2-dev libmcrypt-dev libmagickwand-dev libjpeg-dev" \
    && apt-get purge --auto-remove -y $requirementsToRemove

ENV OWNCLOUD_VERSION 8.0.0

RUN apt-get update && apt-get install -y bzip2 && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.tar.bz2 -o owncloud.tar.bz2 \
    && tar -xjf owncloud.tar.bz2 -C /var/www/html --strip 1 \
    && rm owncloud.tar.bz2 \
    && apt-get purge -y --auto-remove bzip2

RUN chown -R www-data:www-data /var/www/html

RUN a2enmod rewrite
