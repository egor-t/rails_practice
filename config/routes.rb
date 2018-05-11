Rails.application.routes.draw do
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

  resources :tickets, only: [:index, :show, :destroy]
  resources :trains do
    resources :tickets, only: [:new, :create]
  end

  root 'routes#index'
end
