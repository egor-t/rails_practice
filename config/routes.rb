Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
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
    resources :tickets
  end

  resource :search, only: [:show, :new, :edit]
  resources :tickets, only: [:index, :show, :destroy, :edit]
  resources :trains do
    resources :tickets, only: [:new, :create]
  end

  root to: 'searches#show'
end
