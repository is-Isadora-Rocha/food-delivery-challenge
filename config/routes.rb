Rails.application.routes.draw do
  namespace :api do
  resources :users, only: [:create]
  resources :orders, only: [:create]
  get 'orders/user/:user_id', to: 'orders#by_user'
end


  root "sessions#new"
  resources :orders, only: [:index, :new, :create]
  resource :session, only: [:new, :create, :destroy]
end
