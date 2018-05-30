Rails.application.routes.draw do
  
  resources :wikis
  
  resources :charges, only: [:new, :create]
  
  resources :downgrade, only: [:new, :create]
  
  post 'downgrade/create'
  
  get 'welcome/index' => 'welcome#index'

  get 'welcome/about' => 'welcome#about'
  
  root 'welcome#index'
  
  # devise_for :users
  
  devise_for :users, controllers: { confirmations: 'confirmations' }
end
