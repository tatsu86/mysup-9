Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'mypage', to: 'users#show'
  get ':unique_id', to: 'users#other'
  get 'posts/search', to: 'posts#search'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts
  resources :comments, only: %i[create  destroy]
  resources :users, only: %i[new create edit update]
  resources :likes, only: %i[create destroy]
end
