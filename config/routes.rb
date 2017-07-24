Rails.application.routes.draw do
  scope '/api', defaults: {format: :json} do
    post '/users/sign_up', to: 'users#create'
    post '/users/sign_in', to: 'sessions#create'
  end

  namespace :api, defaults: {format: :json} do
    resources :posts, only: [:index, :show]
  end

  # Sidekiq Web Console
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
