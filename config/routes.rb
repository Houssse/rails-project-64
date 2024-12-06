Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [ :create ], shallow: true
  end

  root "home#index"
end
