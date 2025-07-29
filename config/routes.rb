Rails.application.routes.draw do

  # ----------------- API ----------------- #
  namespace :api do
    get 'orders/user/:id', to: 'orders#by_user'
    resources :users, only: [:create]
    resources :orders, only: [:index, :create, :show]
  end

  # ------------- Web Interface -------------#
  # Sessões (Login Fake)
  resource :session, only: [:new, :create, :destroy]
  root "sessions#new"

  # Pedidos (Orders)
  # Busca de pedidos por ID de usuário formulário de busca de pedidos

  resources :orders

  # -------------ADMIN -------------#
  namespace :admin do
    get  'orders/search', to: 'orders#search_form',  as: :orders_search_form
    post 'orders/search', to: 'orders#search_results', as: :orders_search_results
  end

end
