FROM node:slim
MAINTAINER chadrien <chadrien@chadrien.fr>

ENV GHOST_VERSION 0.5.5
ENV GHOST_URL https://ghost.org/zip/ghost-${GHOST_VERSION}.zip
ENV GHOST_DIR /usr/src/ghost

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/* \
    && curl -sSL ${GHOST_URL} -o ghost.zip \
    && mkdir -p ${GHOST_DIR} \
    && unzip -uo ghost.zip -d ${GHOST_DIR} \
    && rm ghost.zip \
    && cd ${GHOST_DIR} \
    && sed -e 's/my-ghost-blog.com/www.chadrien.fr/' -e 's/127.0.0.1/0.0.0.0/' config.example.js > config.js \
    && npm install --production \
    && apt-get purge -y --auto-remove unzip

WORKDIR ${GHOST_DIR}

EXPOSE 2368
CMD ["npm", "start", "--production"]