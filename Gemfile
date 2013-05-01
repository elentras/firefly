source 'https://rubygems.org'
gem 'rails', '3.2.13'

group :assets do
  gem "therubyracer", :require => 'v8'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "bootstrap-sass", '~> 2.3.1.0'
end

gem 'jquery-rails'
gem "haml"
# gem "haml-rails"

gem "mongoid", ">= 3.1.2"
gem 'bson_ext'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick', :git => 'git://github.com/probablycorey/mini_magick.git'

gem "devise", ">= 2.2.3"
gem 'devise_invitable', '~> 1.1.0'

gem "figaro", ">= 0.6.3"

gem "capistrano"

gem "cancan"
gem 'whenever', :require => false

# Connect to the Transmission API
gem "astrobot"

gem 'unicorn'


group :development do
  gem "better_errors", ">= 0.7.2"
  gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx]
  gem "quiet_assets", ">= 1.0.2"
  gem "factory_girl_rails", ">= 4.2.0"
  gem "rspec-rails", ">= 2.12.2"
end

group :test do
  gem "factory_girl_rails", ">= 4.2.0"
  gem "rspec-rails", ">= 2.12.2"
  gem "database_cleaner", ">= 1.0.0.RC1"
  gem "mongoid-rspec", ">= 1.7.0"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.1", :require => false
  gem "launchy", ">= 2.2.0"
  gem "capybara", ">= 2.0.3"
end
