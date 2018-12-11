Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get "users/logout" => 'users#logout'
  resources :users, only: [:new,:show,:edit]
end
