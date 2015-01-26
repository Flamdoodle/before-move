Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'welcome#home'
  # root 'members#new'
  resources :members
  resources :inqueries
end
