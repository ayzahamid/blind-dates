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

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rails', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 3.1'
end
