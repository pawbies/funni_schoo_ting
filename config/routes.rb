Rails.application.routes.draw do
  get "borrows/:id/new" => "borrow#new", as: :new_borrow
  post "borrows/create" => "borrow#create", as: :borrows
  get "borrows/:id/edit" => "borrow#edit", as: :edit_borrow
  get "borrows/destroy" => "borrow#destroy", as: :destroy_borrow
  resources :authors
  resources :books
  resources :publishers
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#home"

  get "login" => "users#login", as: :login
  post "verify_login" => "users#verify_login", as: :verify_login
  get "logout" => "users#logout", as: :logout
end
