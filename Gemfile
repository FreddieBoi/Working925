source 'http://rubygems.org'

gem "rails", "3.1.3"

# Use SQLite in development (and test)
group :development, :test do
  gem 'sqlite3'
end

# Use postgres and thin in production
group :production do
  gem 'pg'
  gem 'thin'
end

# Gems used only for assets
group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'sass'
gem 'sass-rails', '~> 3.1.5'

gem 'jquery-rails'

gem 'devise'

gem 'inherited_resources', '>= 1.3.1'

gem 'has_scope'

gem 'friendly_id', '~> 4.0.0'

gem 'gravatar_image_tag'

group :development do
  gem 'annotate', '2.4.1.beta1'
  # To use debugger
  gem 'debugger'
end

group :test do
# Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
