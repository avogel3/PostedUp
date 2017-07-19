Rails.application.routes.draw do
  scope '/api' do
    devise_for :users
  end

  namespace :api do
    resources :posts do
      resources :comments, only: [:create]
    end
    get '/my_posts', to: 'posts#my_posts'
  end

  root to: 'api/posts#index'
  # Sidekiq Web Console
  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
