Rails.application.routes.draw do

  root 'pages#homepage'

  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
  get  '/contact', to: 'pages#contact'


end
