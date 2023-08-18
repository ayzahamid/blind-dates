#!/bin/bash

# Executing Bundle Run
# ====================
cd /var/www && bundle config set force_ruby_platform true
cd /var/www && bundle install

# Setting up DB & running migrations
# ====================
cd /var/www && bundle exec rake db:create
cd /var/www && bundle exec rake db:migrate
cd /var/www && bundle exec rake db:seed

# Starting the application
# ========================
rm /var/www/tmp/pids/server.pid
cd /var/www/ && rails server -p 3000 -b '0.0.0.0'
