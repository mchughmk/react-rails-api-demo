FROM ruby:2.3
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /code
WORKDIR /code
ADD Gemfile /code/Gemfile
ADD Gemfile.lock /code/Gemfile.lock
RUN bundle install
ADD . /code
