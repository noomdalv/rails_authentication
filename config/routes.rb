Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]
end
