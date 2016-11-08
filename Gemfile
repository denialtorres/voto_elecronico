source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Use postgres as the database for Active Record
gem 'pg'
gem 'puma'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Creates sitemaps and pings search engine
gem 'sitemap_generator'

# HMAC authentication for Rails and HTTP Clients
gem 'api-auth'

# Load environment variable variables
gem 'figaro'

# Console and Logging
#------------------------------------------------------------------------------

# Makes pry the defualt REPL for 'rails console'
gem 'pry-rails'

# Less spammy logging
gem 'lograge'

group :production do
  # Rack HTTP server for fast clients and Unix
  gem 'unicorn'

  # New Relic tracks
  gem 'newrelic_rpm'
end

group :development, :test do
  # RSpec for Rails-3+
  gem 'rspec-rails', '~> 3.5'

  # Call 'byebug' anywhere in the code to stop
  # execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :test do
  # Factory Girl
  gem 'factory_girl_rails', require: false

  # Library for stubbing and setting expectations on HTTP requests in Ruby.
  gem 'webmock'
  # Code coverage for Ruby
  gem 'simplecov', require: false
end

group :development do
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  gem 'mina', '>= 0.3.7'
  gem 'mina-nginx', require: false
  gem 'mina-newrelic', require: false
  gem 'mina-sitemap_generator', require: false

  gem 'guard'
  gem 'guard-rubocop'
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
end
