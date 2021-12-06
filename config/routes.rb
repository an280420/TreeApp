Rails.application.routes.draw do
  root 'pages#index'
  
  get 'add', to: 'pages#new'
  post 'pages', to: 'pages#create'
  get ':name', to: 'pages#show'
  get ':name/edit', to: 'pages#edit'
  patch ':name', to: 'pages#update'

  get '*page_path/:name/edit', to: 'pages#edit'
  patch '*page_path/:name', to: 'pages#update'
  get '*page_path/:name/add', to: 'pages#new'
  get '*page_path/:name', to: 'pages#show'
end
