Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

get 'users/account', to: 'users#account', as: 'user_account'
  resources :users, only: [] do
    member do
      get :edit_profile  # プロフィール編集ページ
      patch :update_profile
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
  # root to: "devise/sessions#new"
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#home"
  # root "posts#index"
  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      get :search
    end
  resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:show, :index]
  root to: "rooms#search"
end
