# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do
  get "about", to: "about#index"

  get "password", to: "passwords#edit"
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"
  
  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"
  
  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"
  
  delete "logout", to: "session#destroy"
  root to: "main#index"  
end
