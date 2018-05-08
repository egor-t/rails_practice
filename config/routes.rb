Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :routes
  resources :carriages
  # resources :carriages, controller: 'carriages', type: 'CoupeCarriage'

  root 'routes#index'
end
