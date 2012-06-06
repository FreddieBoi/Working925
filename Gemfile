source 'http://rubygems.org'

gem "rails", "3.1.3"

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
# Doing this outside of assets block to make activeadmin work properly
gem 'sass'
gem 'sass-rails', '~> 3.1.5'

gem 'jquery-rails'

gem 'devise'

group :development do
  gem 'annotate', '2.4.1.beta1'
  # To use debugger
  gem 'debugger'
end

group :test do
# Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
