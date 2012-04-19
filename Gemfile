source :rubygems

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'rake', '~> 0.9.2.2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.1.0'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier'
end

group :test, do
  gem 'minitest', '>= 2.10'
end

group :test, :development do
  gem 'hoe', '~> 3.0.3'
#  gem 'minitest', '>= 2.12.1'
  gem 'sqlite3'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov', "~> 0.6.1"
  gem 'autotest'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
end

gem 'jquery-rails'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
