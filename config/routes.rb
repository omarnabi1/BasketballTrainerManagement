Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route 1. to display the log in 2. to process the log in
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  
  #logout route
  delete '/logout' => 'sessions#destroy'
 
  resources :appointments
  resources :locations
  resources :clients
  resources :users


end