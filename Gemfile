source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3'

gem 'pg', '~> 0.18'                     # Use postgresql as the database for Active Record
gem 'puma', '~> 3.0'                    # Use Puma as the app server
gem 'sass-rails', '~> 5.0'              # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'              # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'            # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'                      # Use jquery as the JavaScript library
gem 'turbolinks', '~> 5'                # Faster page loads
gem 'jbuilder', '~> 2.5'                # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'haml-rails', '~> 0.9'              # Use HAML for the views
gem 'bootstrap-sass', '~> 3.3.6'        # TWBS styles
gem 'simple_form'                       # Simple Form Rails
gem 'redcarpet'                         # Markdown Parser
# gem 'redis', '~> 3.0'                 # Use Redis adapter to run Action Cable in production
gem 'coderay'                           # Ruby Syntax Highlighting
gem 'carrierwave', '~> 0.9'             # Handle Photo Uploads
gem 'carrierwave-dropbox'               # Carrierwave adapter for Dropbox
gem 'devise'                            # User Authentication
gem 'cancancan', '~> 1.10'              # User abilities

group :development, :test do
  gem 'pry-rails'                       # Pry as rails console
  gem 'rspec-rails', '~> 3.5'           # Specs as test framework
  gem 'faker', github: 'stympy/faker'   # Fake data
  gem 'factory_girl_rails'              # Test Factories
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'      # 1 line tests
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'rails-controller-testing'
end

group :development do
  gem 'guard'                           # Automate tests and page refeshes
  gem 'guard-rspec', require: false     # Run specs on file save
  gem 'guard-cucumber'                  # Run features on file save
  gem 'guard-livereload', '~> 2.5', require: false # Hot reload rails server on view saves
  gem 'annotate'                        # Annotate models
  gem 'hirb'                            # Pretty Formatting for the console
  gem 'better_errors'                   # Exactly what it says
  gem 'binding_of_caller'               # Provide REPL/IRB and stack trace
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Ruby platform specific dependencies
# gem 'therubyracer', platforms: :ruby
