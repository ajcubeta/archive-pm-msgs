source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'puma', '~> 3.7'
gem 'pg', '~> 0.18'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'rack-cors'
gem 'active_model_serializers', '~> 0.10.0'
gem 'icalendar'
gem 'kaminari'
gem 'postmark-rails'
gem 'validator-nric'
gem 'whenever'
gem 'oink'
gem 'mongoid'
gem 'bson_ext'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'awesome_print'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'rubocop', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
