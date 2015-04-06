Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users, :path => '', :path_names => {:sign_up => 'admins/new-partner-sign-up',:sign_in => 'sign-in', :sign_out => 'sign-out'}, :controllers => {:registrations => "registrations"}
  resources :users
  resources :admins, except: [:index]
  resources :partners, except: [:index] 

  namespace :admins do 
    get 'dashboard', to: 'dashboard#index', as: '/dashboard' 
  end

  namespace :partners do 
    get 'dashboard', to: 'dashboard#index', as: '/dashboard' 
  end

end

