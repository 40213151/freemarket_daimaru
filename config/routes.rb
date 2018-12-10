Rails.application.routes.draw do
  root 'items#index'
  get "users/login" => 'users#login'
  get "users/logout" => 'users#logout'
  get "users/new" => 'users#new'
  get "users/new1" => 'users#new1'
  get "users/1" => 'users#show'
  get "users/edit" => 'users#edit'
end
