Rails.application.routes.draw do
  get 'searches/show'

  resources :railway_stations do
    member do
      patch :update_position
      patch :update_time
    end
  end

  resources :trains do
    resources :carriages, shallow: true
  end
  resources :routes
  resources :carriages
  resource :search, only: [:show, :new, :edit]
  
  root 'routes#index'
end
