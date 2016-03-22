Rails.application.routes.draw do
  root 'static#home'
  resources :users
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/ride/:id', to: 'attractions#ride', as: 'ride'



end