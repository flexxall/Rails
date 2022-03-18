Rails.application.routes.draw do
  resources :projects do
    resources :tasks
  end
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  
  get "projects", to: "projects#index"
  get "about", to: "about#index"

  
  delete "logout", to: "sessions#destroy"

  # root "projects#index"
  root "main#index"
end
