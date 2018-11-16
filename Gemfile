source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# System
gem 'rails'
gem 'pg'
gem 'puma'

# Serializer
gem 'jsonapi-rails', github: 'jsonapi-rb/jsonapi-rails'

# Authentication
gem 'devise'
gem 'jwt_sessions'

# Trailblazer bundle
gem 'trailblazer-endpoint', github: 'trailblazer/trailblazer-endpoint'
gem 'trailblazer-rails'
gem 'reform-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'

  # Linters
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  # Add a comment summarizing the current schema to the models
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'dox', require: false
  gem 'json_matchers'
  gem 'ffaker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
