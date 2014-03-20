source 'https://rubygems.org'

ruby '2.1.0'
gem 'rails', '4.0.4'

gem 'thin', '~> 1.6.2'
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '~> 2.5.0'
gem 'therubyracer', '~> 0.12.1'
gem 'coffee-rails', '~> 4.0.1'
gem 'jquery-rails', '~> 3.1.0'
gem 'turbolinks', '~> 2.2.1'
gem 'bootstrap-generators', '~> 3.1.1'
gem 'bootstrap-sass', '~> 3.1.0'
gem 'haml-rails', '~> 0.5.3'
gem 'simple_form', '~> 3.0.1'
gem 'simple-navigation', '~> 3.12.2'
gem 'simple-navigation-bootstrap', '~> 1.0.0'
gem 'kaminari', '~> 0.15.1'
gem 'kaminari-bootstrap', '~> 3.0.1'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'datetimepicker-rails', require: 'datetimepicker-rails', github: 'newstler/datetimepicker-rails'
gem 'devise', '~> 3.2.3'
gem 'devise-i18n', '~> 0.10.3'
gem 'kaminari-i18n', '~> 0.1.3'
gem 'rails-i18n', '~> 4.0.1'
gem 'decent_exposure', '~> 2.3.1'
gem 'draper', '~> 1.3.0'

group :development do
  gem 'guard-rails', '~> 0.5.0'
  gem 'guard-bundler', '~> 2.0.0'
  gem 'guard-livereload', '~> 2.1.1', require: false
  gem 'rack-livereload', '~> 0.3.15'
  gem 'quiet_assets', '~> 1.0.2'
  gem 'better_errors', '~> 1.1.0'
  gem 'heroku'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3.9'
  gem 'rspec-rails', '3.0.0.beta1'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'ffaker', '~> 1.23.0'
  gem 'spring-commands-rspec', '~> 1.0.1'
  gem 'guard-rspec', '~> 4.2.2'
  gem 'rspec-collection_matchers', '~> 0.0.3'
  gem 'rspec-its', '~> 1.0.0'
  unless ENV['RM_INFO']
    gem 'pry', '~> 0.9.12.6'
    gem 'pry-debugger', '~> 0.2.2'
    gem 'pry-remote', '~> 0.1.8'
  end
  gem 'binding_of_caller', '~> 0.7.2'
end

group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor', '~> 0.0.2'
end
