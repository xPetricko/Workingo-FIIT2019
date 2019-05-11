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

  get 'statistics/main'
  get 'statistics/by_categories'
  get 'statistics/by_states'


  post '/offers', to: 'offers#create'
  delete '/offers', to: 'offers#destroy'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users
  resources :offers
  resources :pages


end
