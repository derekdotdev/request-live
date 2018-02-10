source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'awesome_print', '~> 1.8'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'cancancan', '~> 2.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'omniauth-facebook', '~> 4.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'rails_admin', '~> 1.2'
gem 'rolify', '~> 5.2'
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass', '~> 2.2', '>= 2.2.12.1'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'pry-byebug', '~> 3.5', '>= 3.5.1'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

group :development do
  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.17'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'poltergeist', '~> 1.17', require: false
  gem 'shoulda-callback-matchers', '~> 1.1', '>= 1.1.4'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
