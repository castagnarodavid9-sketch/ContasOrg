Rails.application.routes.draw do
  resources :debitos
  resources :contratos
  # ROTAS PRINCIPAIS
  root to: "home#index"
  
  # ROTAS DO SISTEMA
  resources :userconfs

  # ROTAS DO DEVISE
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
end
