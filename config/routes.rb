Rails.application.routes.draw do

  get '/rentals/new', to: 'rentals#new', as: :new_rental
  post '/rentals/create', to: 'rentals#creare', as: :create_rental
  resources :rentals
  # Overrides internal mapping
  get '/cars/search', to: 'cars#search'
  resources :cars

  get '/users/logout', to: 'users#logout'

  get '/users/sign_in', to: 'users#sign_in'
  post '/users/login', to: 'users#login', as: :login

  get '/users/sign_up', to: 'users#sign_up'
  post '/users/register', to: 'users#register', as: :register

  get '/users/profile', to: 'users#profile'

  get '/users/edit', to: 'users#edit'
  post '/users/update', to: 'users#update', as: :edit

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "cars#index", as: :home

end
