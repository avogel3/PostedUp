Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      put '/post_later', to: 'posts#post_later'
    end
  end
  root to: 'posts#index'
  get '/my_posts', to: 'posts#my_posts'
end
