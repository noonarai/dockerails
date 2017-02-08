FROM ruby:2.3-alpine

RUN apk add --no-cache \
  alpine-sdk \
  tzdata \
  nodejs \
  mariadb-dev

ENV APP_ROOT /opt/app

WORKDIR $APP_ROOT

COPY Gemfile* $APP_ROOT/
RUN bundle install -j4
