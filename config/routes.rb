Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root 'welcome#home'
  # root 'members#new'
  resources :members
  resources :inqueries

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # OmniAuth
  get 'auth/facebook/callback', to: 'sessions#create_facebook'
  get 'auth/twitter/callback', to: 'sessions#create_twitter'
  get 'auth/failure', to: redirect('/')

  # Create Tweets
  resources :tweets, only: [:new, :create]
end
