# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :challenges do
    member do
      get :request_membership
      get :show_owner
    end
    collection do
      get :my_challenges
    end
  end

  resources :requests, only: %i[accept reject] do
    member do
      get :accept
      get :reject
    end
  end

  resources :entries, only: %i[new destroy create] do
    member do
      get :new
      get :destroy
      post :create
    end
  end

  controller :confirmations do
    match 'confirmations/:type/:id/:challenge_id', to: 'confirmations#show', via: %i[get]
  end

  root 'challenges#index'
  resources :users, only: [:create]
  resources :sessions, only: %i[new create destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  match '/auth/:provider/callback', to: 'sessions#create_oauth', via: %i[get post]
  match '/auth/failure',            to: 'sessions#failure', via: %i[get post]
end
