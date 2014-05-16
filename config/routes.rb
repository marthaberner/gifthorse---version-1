Rails.application.routes.draw do

  root 'welcome#index'

  resources :users

  resources :sessions, only: [:create, :destroy]
end
