Rails.application.routes.draw do
  root 'home#index'
  get 'explore', to: 'posts#search'
  get 'home', to: 'posts#index'
  get ':unique_id/status/:id', to: 'posts#show'
  get 'settings/profile', to: 'users#edit'
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :posts, only: %i[new create destroy]
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[new create update]
  resources :relationships, only: %i[create destroy]
  resources :likes, only: %i[create destroy]

  get ':unique_id', to: 'users#show'
  get ':unique_id/following', to: 'users#following'
  get ':unique_id/followers', to: 'users#followers'
end
