Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users, only: [:new,:show,:edit] do
    collection do
      get :search
    end
  end
end
