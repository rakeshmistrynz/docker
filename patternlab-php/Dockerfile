FROM php:5-cli
MAINTAINER chadrien <chadrien@chadrien.fr>

ENV PATTERNLAB_PHP_VERSION 1.0.0

RUN apt-get update \
	&& apt-get install -y unzip \
	&& mkdir -p /opt/patternlab-php \
	&& cd /opt/patternlab-php \
	&& curl -sSLO https://github.com/pattern-lab/patternlab-php/archive/v${PATTERNLAB_PHP_VERSION}.zip \
	&& unzip v${PATTERNLAB_PHP_VERSION}.zip \
	&& mv patternlab-php-${PATTERNLAB_PHP_VERSION}/* . \
	&& rm -rf patternlab-php-${PATTERNLAB_PHP_VERSION} v${PATTERNLAB_PHP_VERSION}.zip \
	&& php core/builder.php -g \
	&& rm -rf source \
	&& apt-get purge --auto-remove -y unzip \
	&& rm -r /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget \
    && wget -P /usr/local/bin https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego \
	&& chmod u+x /usr/local/bin/forego \
    && cd /opt/patternlab-php \
    && echo "web: php -S 0.0.0.0:80 -t public" > Procfile \
    && echo "build: php core/builder.php -w" >> Procfile \
    && apt-get purge --auto-remove -y wget \
    && rm -r /var/lib/apt/lists/*

WORKDIR /opt/patternlab-php
VOLUME /opt/patternlab-php/source
EXPOSE 80

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["forego", "start", "-r"]