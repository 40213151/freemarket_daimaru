Rails.application.routes.draw do
  root 'items#index'
  get "users/login" => 'users#login'
  get "users/logout" => 'users#logout'
  get "users/1" => 'users#show'
  get "users/edit" => 'users#edit'
end
