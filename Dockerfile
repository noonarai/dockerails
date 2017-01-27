FROM ruby:2.3-alpine

MAINTAINER shogo noonarai@gmail.com

RUN apk add --no-cache \
  alpine-sdk \
  nodejs \
  mariadb-dev

ENV APP_ROOT /opt/app

WORKDIR $APP_ROOT

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install -j4
