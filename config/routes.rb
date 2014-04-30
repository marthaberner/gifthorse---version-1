Rails.application.routes.draw do

  root 'gifts#index'

  get 'about/about', to: 'about#about'

  get '/gifts', to: 'gifts#index'

  get '/gifts/new', to: 'gifts#new'

  post '/gifts/', to: 'gifts#create'

end
