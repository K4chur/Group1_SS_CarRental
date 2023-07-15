Rails.application.routes.draw do
  resources :rentals
  resources :cars
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "home#index"

  # Sign_in Page
  get "sign_in", to: "sign_in#index"
  post "sign_in", to: "sign_in#login"

  # Sign_up Page
  get "sign_up", to: "sign_up#new"
  post "sign_up", to: "sign_up#create"

  # Home Page
  get "logout", to: "home#logout"

  # Search_car Page
  get "search_car", to: "search_car#index"

  # Profile Page
  get "profile", to: "profile#index"
end
