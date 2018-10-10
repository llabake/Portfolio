# frozen_string_literal: true

Rails.application.routes.draw do
  resources :potfolios, except: [:show]

  get 'potfolio/:id', to: 'potfolios#show', as: 'potfolio_show'
  resources :blogs

  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
