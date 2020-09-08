Rails.application.routes.draw do

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  resources :appointments
  resources :locations
  resources :clients
  resources :users


end