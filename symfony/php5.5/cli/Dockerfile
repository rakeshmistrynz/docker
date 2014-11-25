FROM php:5.5-cli
MAINTAINER chadrien <chadrien@chadrien.fr>

RUN buildRequirements="libicu-dev g++" \
    && apt-get update && apt-get install -y ${buildRequirements} \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && apt-get purge -y ${buildRequirements} \
    && runtimeRequirements="libicu52" \
    && apt-get install -y --auto-remove ${runtimeRequirements} \
    && rm -rf /var/lib/apt/lists/* \
    && echo "date.timezone=Europe/Paris" >> /usr/local/etc/php/php.ini \
    && echo "short_open_tag=Off" >> /usr/local/etc/php/php.ini

RUN curl -sSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*