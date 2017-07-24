source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.3'

gem 'pg', '~> 0.18'                     # Use postgresql as the database for Active Record
gem 'puma', '~> 3.0'                    # Use Puma as the app server
gem 'redcarpet'                         # Markdown Parser
gem 'coderay'                           # Ruby Syntax Highlighting
gem 'carrierwave', '~> 0.9'             # Handle Photo Uploads
gem 'carrierwave-dropbox'               # Carrierwave adapter for Dropbox
gem 'sidekiq'                           # Queue adapter for Jobs
gem 'koala'                             # Facebook API
gem 'kaminari'                          # Pagination
gem 'active_model_serializers', '~> 0.10.0' # Serialize Models to REST API
gem 'rack-cors', :require => 'rack/cors'# Cross Origin Requests
gem 'bcrypt'                            # has_secure_password

group :development, :test do
  gem 'pry-rails'                       # Pry as rails console
  gem 'rspec-rails', '~> 3.5'           # Specs as test framework
  gem 'faker', github: 'stympy/faker'   # Fake data
  gem 'factory_girl_rails'              # Test Factories
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'      # 1 line tests
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'rails-controller-testing'
end

group :development do
  gem 'guard'                           # Automate tests and page refeshes
  gem 'guard-rspec', require: false     # Run specs on file save
  gem 'annotate'                        # Annotate models
  gem 'hirb'                            # Pretty Formatting for the console
  gem 'better_errors'                   # Exactly what it says
  gem 'binding_of_caller'               # Provide REPL/IRB and stack trace
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end


