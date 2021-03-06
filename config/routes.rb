# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

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

  resource :search, only: %i[show new edit]
  resources :tickets, only: %i[index show destroy edit]
  resources :trains do
    resources :tickets, only: %i[new create]
  end

  root to: 'searches#show'
end
