source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use postgres as the database for Active Record
gem 'pg'

# JSONAPI resources gem for JSONAPI conformity
gem 'jsonapi-resources', '0.5.8'

gem 'unicorn'

group :test, :development do
  gem 'byebug', '~> 4.0.5'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.4.3'
  gem 'pry', '~> 0.10.1'
  gem 'pry-byebug', '~> 3.1.0'
  gem 'rubocop', '~> 0.29.1', require: false
  gem 'rspec-rails', '~> 3.2.1'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'spring', '~> 1.3.4'
  gem 'spring-commands-rspec', '~> 1.0.4'
end

group :development do
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end

group :test do
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner', '~> 1.1.1'
  gem 'fuubar', '~> 2.0.0'
  gem 'json-schema'
  gem 'timecop', '~> 0.7.3'
end

group :production do
  gem 'rails_12factor'
end
