Rails.application.routes.draw do
  devise_for :users, controllers: { 
    session: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/rentals/new', to: 'rentals#new', as: :new_rental
  post '/rentals/create', to: 'rentals#create', as: :create_rental
  resources :rentals
  # Overrides internal mapping
  get '/cars/search', to: 'cars#search'
  resources :cars

  get '/users/profile', to: 'users#profile', as: :profile

  get '/users/edit', to: 'users#edit'
  post '/users/update', to: 'users#update', as: :edit

  post '/users', to: 'registrations#create', as: :register
  get '/users/sign_up', to: 'registrations#new', as: :new_register
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "cars#index", as: :home
end
