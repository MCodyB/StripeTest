Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root to: "users#index"

  devise_for :users

  get  "callback" => "auth#callback"
  post "callback" => "auth#callback"


  resources :users, only: [:index, :show]

  resources :charges
end
