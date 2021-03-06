# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'topics/index'
  # get 'topics/show'
  resources :topics, only: %i[index show]
  # resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :potfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'potfolios#angular'

  get 'potfolio/:id', to: 'potfolios#show', as: 'potfolio_show'
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
