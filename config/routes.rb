Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [ :create ]
    resources :likes, only: [ :create, :destroy ]
  end

  root "home#index"
end
