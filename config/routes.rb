Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root to: "users#index"

  devise_for :users

  resources :users, only: [:index, :show]

  resources :charges
end
