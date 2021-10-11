#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails assets:precompile
bundle exec rails webpacker:compile

RAILS_SERVE_STATIC_FILES=true bundle exec rails s -b 0.0.0.0