# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', '~> 1.16.0', require: false
gem 'cssbundling-rails'
gem 'dotenv-rails', '~> 2.8'
gem 'faraday', '~> 2.7.10'
gem 'hamlit', '~> 3.0'
gem 'hamlit-rails', '~> 0.2.3'
gem 'html2haml', '~> 2.3'
gem 'interactor-rails', '~> 2.2.1'
gem 'jbuilder', '~> 2.11.5'
gem 'jsbundling-rails', '~> 1.2.1'
gem 'pagy', '~> 6.0.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.6'
gem 'rails', '~> 7.0.8'
gem 'sprockets-rails', '~> 3.4.2'
gem 'strong_migrations', '~> 1.6.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'bullet', '~> 7.0.7'
  gem 'debug', '~> 1.8.0', platforms: %i[mri mingw x64_mingw]
  gem 'dockerfile-rails', '>= 1.4.1'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'ffaker', '~> 2.22.0'
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  gem 'brakeman', '~> 6.0.0', require: false
  gem 'bundler-audit', '~> 0.9.1', require: false
  gem 'bundler-leak', '~> 0.3.0', require: false
  gem 'lefthook', '~> 1.4.1', require: false
  gem 'rubocop', '~> 1.56.3', require: false
  gem 'rubocop-i18n', '~> 3.0.0', require: false
  gem 'rubocop-performance', '~> 1.19.1', require: false
  gem 'rubocop-rails', '~> 2.21.1', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
  gem 'rubocop-rspec', '~> 2.24.0', require: false
  gem 'traceroute', '~> 0.8.1'
  gem 'web-console', '~> 4.2.1'
end

group :test do
  gem 'rspec-rails', '~> 6.0.2'
  gem 'shoulda-matchers', '~> 5.3.0'
  gem 'vcr', '~> 6.2'
end
