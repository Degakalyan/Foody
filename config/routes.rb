Rails.application.routes.draw do
  resources :images
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#welcome'
  resources :reviews
  resources :dishes do
    resources :reviews
  end
  resources :menus
  resources :users
  resources :carts
  resources :pays
  resources :selected_dishes
  resources :orders
  resources :restaurants do
    resources :reviews
  end

  get 'search', to: 'dishes#search'end
