FROM node:slim

RUN curl -sSL https://github.com/mobz/elasticsearch-head/archive/master.tar.gz -o elasticsearch-head.tar.gz \
    && mkdir -p /usr/src/elasticsearch-head \
    && tar -xzf elasticsearch-head.tar.gz -C /usr/src/elasticsearch-head --strip 1 \
    && cd /usr/src/elasticsearch-head \
    && sed -i -e '84ihostname: "*",' Gruntfile.js \
    && npm install \
    && npm install -g grunt-cli

WORKDIR /usr/src/elasticsearch-head

EXPOSE 9100

CMD ["grunt", "server"]
