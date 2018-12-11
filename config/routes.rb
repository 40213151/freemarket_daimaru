Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "users/logout" => 'users#logout'
  get "users/new1" => 'users#new1'
  resources :users, only: [:show,:edit]
end
