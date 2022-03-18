Rails.application.routes.draw do
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "profile", to: "profiles#edit"
  patch "profile", to: "profiles#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  
  resources :recipes

  # GET /recipes      => recipes controller's index action
  # get "recipes", to: "recipes#index"

  # GET /recipes/:id  => recipes controller's show action
  # get "recipes/:id", to: "recipes#show"

  # GET /recipes/new  => recipes controller's new action
  # get "recipes/new", to: "recipes#new"

  # POST /recipes     => recipes controller's create action
  # post "recipes", to: "recipes#create"

  root "main#index"
end
