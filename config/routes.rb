Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:show, :index]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  
  
  root 'sessions#welcome'
end
