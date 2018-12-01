Rails.application.routes.draw do
  root 'items#index'
  get "users/login" => 'users#login'
  get "users/edit" => 'users#edit'
end
