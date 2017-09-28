source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'dotenv-rails', groups: %i[development test]
gem 'rails', '~> 5.0.3'

gem 'active_model_serializers', '~> 0.8.0'
gem 'bootstrap-sass', '~> 3.3.6'        # TWBS styles
gem 'cancancan', '~> 1.10'              # User abilities
gem 'carrierwave', '~> 0.9'             # Handle Photo Uploads
gem 'carrierwave-dropbox'               # Carrierwave adapter for Dropbox
gem 'coderay'                           # Ruby Syntax Highlighting
gem 'coffee-rails', '~> 4.2'            # Use CoffeeScript for .coffee assets and views
gem 'devise'                            # User Authentication
gem 'haml-rails', '~> 0.9'              # Use HAML for the views
gem 'jquery-rails'                      # Use jquery as the JavaScript library
gem 'kaminari'                          # Pagination
gem 'koala'                             # Facebook API
gem 'pg', '~> 0.18'                     # Use postgresql as the database for Active Record
gem 'puma', '~> 3.0'                    # Use Puma as the app server
gem 'redcarpet'                         # Markdown Parser
gem 'sass-rails', '~> 5.0'              # Use SCSS for stylesheets
gem 'sidekiq'                           # Queue adapter for Jobs
gem 'simple_form'                       # Simple Form Rails
gem 'turbolinks', '~> 5'                # Faster page loads
gem 'uglifier', '>= 1.3.0'              # Use Uglifier as compressor for JavaScript assets

group :development, :test do
  gem 'factory_girl_rails'              # Test Factories
  gem 'faker', github: 'stympy/faker'   # Fake data
  gem 'pry-rails'                       # Pry as rails console
  gem 'rspec-rails', '~> 3.5'           # Specs as test framework
end

group :test do
  gem 'capybara-webkit'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'      # 1 line Rails tests
end

group :development do
  gem 'better_errors'                   # Exactly what it says
  gem 'binding_of_caller'               # Provide REPL/IRB and stack trace
  gem 'guard'                           # Automate tests and page refeshes
  gem 'guard-cucumber'                  # Run features on file save
  gem 'guard-livereload', '~> 2.5', require: false # Hot reload rails server on view saves
  gem 'guard-rspec', require: false # Run specs on file save
  gem 'hirb' # Pretty Formatting for the console
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
