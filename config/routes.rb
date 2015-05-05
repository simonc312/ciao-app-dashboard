Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users, :path => '', :path_names => {:sign_up => 'admin/new-partner-sign-up',:sign_in => 'sign-in', :sign_out => 'sign-out'}, :controllers => {:registrations => "registrations"}
  resources :users
  resources :admins, except: [:index]
  resources :partners, except: [:index] 

  namespace :admin do 
    get 'dashboard', to: 'dashboard#index', as: '/dashboard'
    post 'dashboard/update-user-filters', to: 'dashboard#update_user_filters', as:'/dashboard/update-user-filters'
    patch 'dashboard/update-fixed-costs', to: 'dashboard#update_fixed_costs', as: '/dashboard/update-fixed-costs' 
    post 'dashboard/update-graph-filters', to: 'dashboard#update_graph_filters', as:'/dashboard/update-graph-filters'
  end

  namespace :partner do 
    get 'dashboard', to: 'dashboard#index', as: '/dashboard' 
  end

end

