Rails.application.routes.draw do
  
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'plan', to: 'pages#plan'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new'
  
end
