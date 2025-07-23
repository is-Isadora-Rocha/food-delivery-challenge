Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i[:create]
    resources :orders, only: %i[:create]
    get 'orders/user/:user/id', to: 'orders#by_user'
  end


  root "sessions#new"
  resources :orders, only: [:index, :new, :create]
  resource :session, only: [:new, :create, :destroy]
end
