source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  #gem 'therubyracer'
end

group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'fakeweb', '>= 1.2.5'
end

group :test, :development do
  gem 'minitest', '>= 2.10'
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'autotest'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'jquery-rails'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-openid'

gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate', '0.0.5'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
