ruby '2.1.2'

source 'https://rubygems.org'
source 'https://rails-assets.org'

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'haml-rails'
gem 'rails-assets-bootstrap'
gem 'erb2haml'
gem 'therubyracer'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'newrelic_rpm'

group :development, :test do
  gem 'sqlite3'
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-byebug'
  gem "binding_of_caller"
  gem 'meta_request'
  gem 'rspec-rails', '~> 3.0.0.rc1'
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :development do
  gem 'quiet_assets'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '~> 2.6.0'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_rewinder'
  gem 'launchy'
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
