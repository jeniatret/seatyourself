Rails.application.routes.draw do

  root "restaurants#index"
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do 
  	resources :reservations
  end
  resources :restaurants do 
  	resources :reservations
  end 
end
