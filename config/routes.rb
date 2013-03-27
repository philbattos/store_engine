StoreEngine::Application.routes.draw do

  root to: "products#index"

  resources :products
  resource  :cart
  resources :categories
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]

  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
end
