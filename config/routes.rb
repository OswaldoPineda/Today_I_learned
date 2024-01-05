# frozen_string_literal: true

Rails.application.routes.draw do
  post '/newsletters', to: 'newsletters#create'

  resources :labels, only: [:index]

  resources :posts

  devise_for :users, controllers: {
    passwords: 'users/passwords'
  }

  get '/users/:id/posts', to: 'posts#user_posts', as: 'user_posts'

  root 'home#index'
end
