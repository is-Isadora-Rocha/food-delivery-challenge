Rails.application.routes.draw do
  resources :orders
  # resource :session, only: %i[:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  root "sessions#new"
end
