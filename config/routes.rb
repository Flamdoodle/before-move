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
end
