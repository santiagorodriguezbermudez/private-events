Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:show, :index, :create, :new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  post 'destroy', to: 'sessions#destroy'
  
  root 'sessions#welcome'
end
