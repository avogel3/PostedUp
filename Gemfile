source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3' 

gem 'pg', '~> 0.18'           # Use postgresql as the database for Active Record
gem 'puma', '~> 3.0'          # Use Puma as the app server
gem 'sass-rails', '~> 5.0'    # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'    # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'  # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'            # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5'      # Faster page loads
gem 'jbuilder', '~> 2.5'      # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'redis', '~> 3.0'       # Use Redis adapter to run Action Cable in production
# gem 'bcrypt', '~> 3.1.7'    # Use ActiveModel has_secure_password
# gem 'therubyracer', platforms: :ruby
gem 'haml-rails', '~> 0.9'    # Use HAML for the views
gem 'bootstrap-sass', '~> 3.3.6'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.5'
  gem 'faker', github: 'stympy/faker'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'annotate'
  gem 'hirb'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
