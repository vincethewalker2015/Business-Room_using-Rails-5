Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'welcome', to: 'pages#welcome'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new'
  
end
