Rails.application.routes.draw do
  resources :restaurants
  resources :users
  resources :reservations
end
