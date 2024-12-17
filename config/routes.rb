# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: %i[create destroy]
  end

  root 'posts#index'
end
