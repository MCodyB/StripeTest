Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  root to: "users#index"

  get  "callback" => "oauth_callbacks#callback"
  post "callback" => "oauth_callbacks#callback"


  resources :users, only: [:index, :show]

  resources :charges
end
