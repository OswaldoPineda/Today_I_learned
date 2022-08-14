# frozen_string_literal: true

Rails.application.routes.draw do
  resources :newsletters
  resources :posts
  devise_for :users
  get '/users/password', to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
