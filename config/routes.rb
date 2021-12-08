Rails.application.routes.draw do
  root 'pages#index'

  # routes for root pages
  get '/add', to: 'pages#new'
  get '/edit', to: 'pages#edit'
  patch '/', to: 'pages#update'
  post '/', to: 'pages#create'

  # routes for chidlen pages
  get '*page_path/edit', to: 'pages#edit', as: :edit_page
  get '*page_path/add', to: 'pages#new', as: :new_page
  patch '*page_path', to: 'pages#update'
  get '*page_path', to: 'pages#show', as: :page
  post '*page_path', to: 'pages#create'

  # resources :page, path_names: { new: 'add' }, param: :name

  # get '*page_path/edit', to: 'pages#edit'
  # get '*page_path/add', to: 'pages#new'
  # get '*page_path', to: 'pages#show'
  # patch '*page_path', to: 'pages#update'
  # post '*page_path', to: 'pages#create'
end
