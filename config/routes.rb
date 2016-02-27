Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", registrations: 'registrations' }

  root to: "things#index"

  resources :users, only: [:index, :show]

  resources :charges
  resources :things
end
