Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resource :profile #Keep it singular as there is only going to be 1 Profile per User
  end
  get 'about', to: 'pages#about'
  get 'plan', to: 'pages#plan'
  resources :contacts, only: :create
  get 'contact-us', to: 'contacts#new'
  
end
