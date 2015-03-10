Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :admins, except: [:index]
  resources :partners 

  namespace :admin do 
    get 'dashboard', to: 'dashboard#index', as: '/dashboard' 
  end

end

