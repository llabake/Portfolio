# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :potfolios, except: [:show]
  get 'angular-items', to: 'potfolios#angular'

  get 'potfolio/:id', to: 'potfolios#show', as: 'potfolio_show'
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
