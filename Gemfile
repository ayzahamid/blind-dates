# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.7'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'interactor-rails', '~> 2.0'
gem 'jbuilder', '~> 2.11.5'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rails', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rspec'
  gem 'faker', '~> 3.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'rspec-rails', '~> 6.0.3'
end
