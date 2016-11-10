source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'


gem 'pg'# Use postgres as the database for Active Record
gem 'puma' # Web server

gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6' # HTML, CSS, and JS framework
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5' # Faster application browsing
gem 'api-auth' # HMAC authentication for Rails and HTTP Clients
gem 'figaro' # Load environment variable variables
gem 'sitemap_generator' # Creates sitemaps and pings search engine

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Console and Logging
#------------------------------------------------------------------------------

gem 'pry-rails' # Makes pry the defualt REPL for 'rails console'
gem 'lograge' # Less spammy logging

group :production do
  gem 'unicorn' # Rack HTTP server for fast clients and Unix
  gem 'newrelic_rpm' # New Relic tracks
end

group :development, :test do
  gem 'byebug', platform: :mri # Console debugger
end

group :test do
  gem 'factory_girl_rails', require: false # Database fixtures
  gem 'rspec-rails', '~> 3.5' # Rails test framework
  gem 'webmock' # Stubbing and expectations on HTTP requests.
  gem 'simplecov', require: false # Code coverage for Ruby
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
