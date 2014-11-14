FROM debian:wheezy
MAINTAINER chadrien <chadrien@chadrien.fr>

RUN groupadd irssi && useradd -m -g irssi irssi

RUN apt-get update \
	&& apt-get install -y curl \
	&& rm -rf /var/lib/apt/lists/*

ENV IRSSI_VERSION 0.8.17
ENV IRSSI_DOWNLOAD_URL http://irssi.org/files/irssi-0.8.17.tar.gz

RUN buildDeps='clang libglib2.0-dev libncurses-dev libssl-dev libperl-dev make'; \
	set -x; \
	apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /usr/src/irssi \
	&& curl -sSL $IRSSI_DOWNLOAD_URL -o irssi.tar.gz \
	&& tar -xzf irssi.tar.gz -C /usr/src/irssi --strip 1 \
	&& rm irssi.tar.gz \
	&& cd /usr/src/irssi \
	&& ./configure --with-proxy \
	&& make \
	&& make install \ 
	&& cd \
	&& rm -r /usr/src/irssi \
	&& apt-get purge -y $buildDeps \
	&& apt-get autoremove -y \
	&& runDeps='libglib2.0-0' \
	&& apt-get update && apt-get install -y $runDeps \
        && rm -rf /var/lib/apt/lists/*

USER irssi
VOLUME "/home/irssi/.irssi"

ENV TERM screen
CMD ["/usr/local/bin/irssi"]
