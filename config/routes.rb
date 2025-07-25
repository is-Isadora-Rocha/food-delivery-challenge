Rails.application.routes.draw do

  # ----------------- API ----------------- #
  namespace :api do
    get 'orders/user/:id', to: 'orders#by_user'
    resources :orders, only: [:index, :create, :show]
  end

  # ------------- Web Interface -------------#
  # Sessões (Login Fake)
  resource :session, only: [:new, :create, :destroy]
  root "sessions#new"

  # Pedidos (Orders)
  # Busca de pedidos por ID de usuário formulário de busca de pedidos
  resources :orders, only: [:index, :new, :create] do
    collection do
      get :by_user_form
      post :by_user
    end
  end
end
