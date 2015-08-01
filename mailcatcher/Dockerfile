FROM ruby:latest

ENV MAILCATCHER_VERSION 0.5.12

RUN gem install mailcatcher -v $MAILCATCHER_VERSION

EXPOSE 1080 1025

CMD ["mailcatcher", "--ip", "0.0.0.0", "-f"]