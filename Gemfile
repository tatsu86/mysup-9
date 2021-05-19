source 'https://rubygems.org'

# gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'rails', '5.2.3'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.0.0'
gem 'mini_racer'
gem 'rails-i18n'
gem 'ransack'
gem 'bcrypt', '~> 3.1.7'
gem 'kaminari'
gem 'font-awesome-sass', '~> 5.4.1'
gem 'carrierwave'
# gem 'aws-sdk-s3', require: false
gem 'fog-aws'
gem 'rmagick'
gem 'mini_magick'
gem 'devise'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rails-flog', require: 'flog'
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.7.0'
  gem 'factory_bot_rails', '~> 4.11'
end

group :test do
  gem 'capybara', '~> 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec_junit_formatter'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-byebug'
  gem 'annotate'
  gem 'spring-commands-rspec'
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
