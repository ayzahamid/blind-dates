FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /var/wwww
WORKDIR /var/wwww
RUN bundle install
RUN bundle config set force_ruby_platform true
CMD ["rails", "server", "-p", "3002", "-b", "0.0.0.0"]
