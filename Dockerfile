FROM ruby:2.7.1

RUN rails s

WORKDIR /code

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY ./code/

EXPOSE 8080