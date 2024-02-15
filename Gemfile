# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.6'

gem 'bootsnap', require: false
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'execjs', '~> 2.7.0'
gem 'haml_lint', require: false
gem 'haml-rails', '~> 2.0'
gem 'haml'
gem 'html2haml'
gem 'importmap-rails'
gem 'jbuilder'
gem 'kaminari'
gem 'materialize-sass', '~> 1.0.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'redcarpet'
gem 'redis', '~> 4.0'
gem 'requestjs-rails'
gem 'rufus-scheduler', '~> 3.2'
gem 'rubocop-performance'
gem 'rubocop-rails', require: false
gem 'rubocop', require: false
gem 'rubycritic', require: false
gem 'sassc-rails'
gem 'sendgrid-ruby'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'whenever', require: false
gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'pry', '~> 0.14.2'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'letter_opener'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  gem 'hotwire-livereload'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "dockerfile-rails", ">= 1.4", :group => :development
