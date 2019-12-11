Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  root 'posts#index'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :index]
>>>>>>> 3b60921297d8ea6da4c14cf13dab4cdea8beef85
end
