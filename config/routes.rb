Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users, only: [:new,:show,:edit, :create] do
    collection do
      get :logout
    end
  end

  devise_scope :user do
    resource :user_info_keep, to: "sessions#user_info_keep", only: :create
    resource :phone_entrypage, to: "sessions#phone_entrypage", only: :new
    resource :phone_info_keep, to: "sessions#phone_info_keep", only: :create
    resource :address_entrypage, to: "sessions#address_entrypage", only: :new
    resource :address_info_keep, to: "sessions#address_info_keep", only: :create
  end

  resources :cards, only: [:new, :create]

  resources :items do
    collection do
      get 'search'
    end
    collection do
      get 'kensaku'
    end
    member do
      post 'pay', to: 'items#pay'
    end
  end
  # resources :payments, only: :create
end
