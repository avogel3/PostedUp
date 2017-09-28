Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
  end
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'

  namespace :api do
    resources :posts, only: %i[index show]
  end

  # Sidekiq Web Console
  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
