Rails.application.routes.draw do
  resources :users do 
  	resources :reservations
  end
  resources :restaurants do 
  	resources :reservations
  end 
end
