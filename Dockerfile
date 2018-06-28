FROM ruby:2.5.1

ENV LANG C.UTF-8

RUN apt-get update -qq && \
 apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  libfontconfig1 \
  imagemagick \
  nodejs && \
  rm -rf /var/lib/apt/lists/*

RUN curl https://cli-assets.heroku.com/install.sh | sh

RUN mkdir /app

WORKDIR /app

RUN bundle config build.nokogiri --use-system-libraries
ADD Gemfile /app/

RUN bundle install
