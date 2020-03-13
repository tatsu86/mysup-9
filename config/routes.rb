Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'posts#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :posts, only: %i[new create destroy]
  get 'explore', to: 'posts#search'
  get ':unique_id/status/:id', to: 'posts#show'
  
  get 'settings/profile', to: 'users#edit'

  resources :comments, only: %i[create destroy]
  resources :users, only: %i[update destroy]
  resources :relationships, only: %i[create destroy]
  resources :likes, only: %i[create destroy]

  get ':unique_id', to: 'users#show'
  get ':unique_id/following', to: 'users#following'
  get ':unique_id/followers', to: 'users#followers'
end
