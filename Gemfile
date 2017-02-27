source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'pg' # Use postgres as the database for Active Record
# gem 'puma' # Web server
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.6' # HTML, CSS, and JS framework
gem 'bootstrap_form'
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'figaro' # Load environment variable variables
gem 'haml' # HTML Abstraction Markup Language - A Markup Haiku
gem 'image-picker-rails'
gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'lograge' # Less spammy logging
gem 'mime-types', '~> 2.0'
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
# install mifiel from source since rubygems for some reason
# requires activesupport 4.2 and conflicts with rails
gem 'mifiel', git: 'https://github.com/Mifiel/ruby-api-client.git'
gem 'sitemap_generator' # Creates sitemaps and pings search engine
gem 'sqlite3'
gem 'turbolinks', '~> 5' # Faster application browsing
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]

gem 'rails-i18n', '~> 5.0.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Console and Logging
#------------------------------------------------------------------------------

gem 'pry-rails' # Makes pry the defualt REPL for 'rails console'

group :production do
  gem 'newrelic_rpm' # New Relic tracks
  gem 'unicorn' # Rack HTTP server for fast clients and Unix

end

group :development, :test do
  # Debugging on the console
  gem 'pry-byebug'
  gem 'rails-erd' # to generate erd diagrams in pdf

end

group :test do
  gem 'capybara', '2.7.1'
  gem 'factory_girl_rails', require: false # Database fixtures
  gem 'rspec-rails', '~> 3.5' # Rails test framework
  gem 'simplecov', require: false # Code coverage for Ruby
  gem 'webmock' # Stubbing and expectations on HTTP requests.
end

group :development do
  # Access an IRB console on exception pages or by using
  # <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'mina', '>= 0.3.7'
  gem 'mina-newrelic', require: false
  gem 'mina-nginx', require: false
  gem 'mina-sitemap_generator', require: false

  gem 'guard'
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'terminal-notifier-guard', require: false
  gem 'web-console'
end
