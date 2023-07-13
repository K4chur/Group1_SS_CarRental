Rails.application.routes.draw do
  resources :rentals
  resources :cars
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "sign_up", to: "sign_up#index"

  root "sign_in#index"
end
