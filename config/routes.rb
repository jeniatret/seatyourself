Rails.application.routes.draw do
  	resources :users 
  resources :restaurants do 
  	resources :reservations
  end 
end
