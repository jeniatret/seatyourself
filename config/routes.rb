Rails.application.routes.draw do
    resources :sessions, only: [:new, :create, :destroy]

  resources :users do 
  	resources :reservations
  end
  resources :restaurants do 
  	resources :reservations	
    resources :reviews, only: [:show, :create, :destroy]
  end 
end
