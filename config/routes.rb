Rails.application.routes.draw do
  resources :challenges do
    member do
      get :request_membership
      get :show_owner
      get :destroy_confirmation
    end
    collection do
      get :my_challenges
    end
  end

  resources :requests do
    member do
      get :accept
      get :reject
      get :remove_confirmation
    end
  end

  resources :entries do
    member do
      get :new
      post :create
    end
  end

  root 'challenges#index'
  resources :users, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  match '/auth/:provider/callback', to: 'sessions#create_oauth', via: [:get, :post]
  match '/auth/failure',            to: 'sessions#failure', via: [:get, :post]
end
