StoreEngine::Application.routes.draw do


  resources :products
  resource  :cart
  root to: "products#index"
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]

  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
end
