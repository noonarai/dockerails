FROM ruby:2.4-alpine

RUN apk add --no-cache \
    alpine-sdk \
    tzdata \
    nodejs \
    mariadb-dev

ENV APP_ROOT /opt/app

WORKDIR $APP_ROOT

COPY Gemfile* $APP_ROOT/
RUN bundle install -j4

ARG RAILS_ENV
ENV RAILS_ENV ${RAILS_ENV:-production}
COPY . $APP_ROOT
RUN if [ $RAILS_ENV = "production" ]; then bundle exec rake assets:precompile --trace; fi
