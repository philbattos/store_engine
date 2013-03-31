StoreEngine::Application.routes.draw do


  root to: "products#index"

  resources :products
  resources :categories
  resource  :cart
  resources :orders
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]

  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
  match 'confirmation' => 'carts#confirmation'
  match 'review_order' => 'application#customer_order'

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end
end
