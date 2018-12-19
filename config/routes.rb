Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users, only: [:new,:show,:edit] do
    collection do
      get :logout
    end
  end
  resources :items, only: [:new, :index]
end
