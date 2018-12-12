Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users, only: [:new,:show,:edit] do
    get :logout, on: :collection
  end
end
