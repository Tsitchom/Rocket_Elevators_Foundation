source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'
#================================================================================================
# API: Dropbox
gem 'dropbox_api'
gem 'carrierwave-dropbox'
# Zendesk
gem "zendesk_api"


#================================================================================================
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes   
# gem 'mini_racer', platforms: :ruby

# Use sendgrid-ruby to send emails
gem 'sendgrid-ruby'
gem 'smtpapi'
gem 'sendgrid-actionmailer'
gem 'figaro'

gem 'bootstrap-sass', '~> 3.3.4'
#
gem 'font-awesome-sass', '~> 4.3.0'
#
gem 'font-awesome-rails'
#
gem 'jquery-ui-rails'
#
gem 'bootstrap-social-rails'
#
gem 'jquery-rails'
#
gem 'owlcarousel-rails', '~> 1.1', '>= 1.1.3.3'
#
gem 'rails_admin'
#
gem 'devise'
#
gem 'capistrano', '~> 3.10', require: false
#
gem 'capistrano-rails', '~> 1.4', require: false
#
gem 'capistrano-bundler', '>= 1.1.0'
#
gem 'capistrano-rake', '~> 0.2.0'
# 
gem 'rvm1-capistrano3', require: false
#
gem 'capistrano3-puma'
#
gem 'capistrano-rails-db'
#
gem 'pg', '~> 1.1', '>= 1.1.4'
#
gem 'whenever', require: false
#
gem 'chartkick', '~> 3.0', '>= 3.0.2'
#
gem 'highcharts-rails', '~> 6.0', '>= 6.0.3'
#
gem 'groupdate', '~> 2.5', '>= 2.5.2'
#
gem 'twilio-ruby', '~> 4.11', '>= 4.11.1'
#
gem 'geocoder', '~> 1.3', '>= 1.3.7'
#
gem 'gmaps4rails', '~> 2.1', '>= 2.1.2'
#
gem 'gon', '~> 6.2'
#
gem 'faraday', '~> 0.9.2'
#
gem 'open-weather', '~> 0.11.0'
#
gem 'rest-client', '~> 1.8'
#
gem 'rspotify'
#
gem 'rufo'
#
gem 'rails-controller-testing'
#
gem 'simplecov', require: false, group: :test
#
gem 'newrelic_rpm'
#
gem 'google-api-client'
#
gem 'listen', '>= 3.0.5', '< 3.2'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  #
  gem 'rspec-rails', '~> 3.8'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'html_validation'
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#==========================================
# API IBM WATSON
gem 'ibm_watson'

#==========================================
# API Slack
gem "slack-notifier"