# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.7'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0'
gem 'puma', '~> 4.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
gem 'bootsnap', require: false

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails_admin', '~> 2.0'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
gem 'jquery-rails'

gem 'active_model_serializers'
gem 'acts_as_votable', '~> 0.10.0'
gem 'bootstrap'
# bootstrap requires tether
# source 'https://rails-assets.org' do
#   gem 'rails-assets-tether', '>= 1.1.0'
# end

gem 'google-analytics-rails'
gem 'omniauth-auth0', '~> 2.2'
gem 'omniauth-rails_csrf_protection', '~> 0.1'
# gem 'quiet_assets'
gem 'rack-cors'
gem 'simple_form'
gem 'turbolinks'
gem 'tzinfo-data'
gem 'validates_formatting_of'
gem 'webpacker', '~> 4.x'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'better_errors'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  # gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end
