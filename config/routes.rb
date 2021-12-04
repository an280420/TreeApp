Rails.application.routes.draw do
  root 'pages#index'

  get 'pages/add', to: 'pages#new'
  get 'pages/edit', to: 'pages#edit'
end
