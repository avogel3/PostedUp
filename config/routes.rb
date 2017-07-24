Rails.application.routes.draw do
  scope '/api' do
    post '/users/sign_up', to: 'users#create'
    post '/users/sign_in', to: 'sessions#create'
  end

  namespace :api do
    resources :posts, only: [:index, :show]
  end

  # Sidekiq Web Console
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
