<<<<<<< Updated upstream
# !/usr/bin/env bash
# exit on error
=======
>>>>>>> Stashed changes
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed
