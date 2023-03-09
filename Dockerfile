FROM ruby:3.2.0-alpine

RUN #apk add --no-cache bash

RUN /bin/sh

COPY  /fordocker  /opt/code/

RUN apk update && apk add --virtual build-dependencies build-base

RUN gem install rails


WORKDIR opt/code/mobprogramming

RUN ls

RUN bundle install

EXPOSE 3000

ENTRYPOINT rails s -b 0.0.0.0 -p 3000
