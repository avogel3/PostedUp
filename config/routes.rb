Rails.application.routes.draw do
  scope '/api' do
  end

  namespace :api do
  end

  # Sidekiq Web Console
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
