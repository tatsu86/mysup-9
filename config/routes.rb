Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'mypage', to: 'users#show'
  get 'users/index', to: 'users#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts
  resources :comments, only: %i[create  destroy]
  resources :users, only: %i[new create edit update]
end
