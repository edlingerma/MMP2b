Rails.application.routes.draw do
  resources :challenges
  root 'home#index'
  resources :users, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  match '/auth/:provider/callback', to: 'sessions#create_oauth', via: [:get, :post]
  match '/auth/failure',            to: 'sessions#failure', via: [:get, :post]
end
