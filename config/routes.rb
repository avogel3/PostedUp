Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
  end
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'
  # Sidekiq Web Console
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
end
