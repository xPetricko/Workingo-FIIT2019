Rails.application.routes.draw do

  root 'pages#home'

  get 'sessions/new'
  get 'users/new'

  get 'offers/new'
  get 'offers/show_all'
  get 'offers/search'
  get 'pages/about'
  get 'pages/home'
  get 'pages/help'


  post '/offers', to: 'offers#create'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users
  resources :offers
  resources :states
  resources :provinces
  resources :cities

end
