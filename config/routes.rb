Rails.application.routes.draw do
  root 'pages#index'
  
  # resources :pages

  get 'pages/add', to: 'pages#new'
  get 'pages/:id/edit', to: 'pages#edit'
  post 'pages/:id', to: 'pages#update'
  get '/add', to: 'pages#new'
  post 'pages', to: 'pages#create'
  get 'pages/:id', to: 'pages#show'
end
