Rails.application.routes.draw do
  resources :stats
  devise_for :users
  mount RailsAdmin::Engine => '/emp-dashboard', as: 'rails_admin'
  resources :elevators
  resources :columns
  resources :batteries
  resources :building_details
  resources :buildings
  resources :customers
  resources :addresses
  resources :leads
  resources :quotes
  
  
  get '/gform', to: 'pages#gform'
  get '/residential', to: 'pages#residential'
  get '/commercial', to: 'pages#commercial'
  get '/index', to: 'pages#index'
  get '/re-admin-login', to: 'pages#re-admin-login'
  get '/rails_admin', to: 'pages#rails_admin'
  get '/users/sign_in', to: 'devise/sessions#new'
  get '/users/sign_out', to: 'pages#index'
  get '/work1', to: 'pages#work1'
  get '/work2', to: 'pages#work2'
  get '/work3', to: 'pages#work3'
  get '/work4', to: 'pages#work4'
  get '/work5', to: 'pages#work5'
  get '/work6', to: 'pages#work6'
  get '/work7', to: 'pages#work7'
  get '/work8', to: 'pages#work8'
  get '/work9', to: 'pages#work9'
  get '/work10', to: 'pages#work10'
  get '/work11', to: 'pages#work11'
  get '/work12', to: 'pages#work12'
  get '/stats', to: 'stats#stats'
  get '/watson', to: 'watson#watson'
  get 'api_rest', to: 'api_rest#api_rest'
  # Dropbox
  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'
  get 'dropbox' => 'dropbox#index'
  
  get '/mapsAPI', to: 'pages#mapsAPI'
  get '/emp-dashboard/geolocation', to: 'pages#mapsAPI' 

  #get '/intervention', to: 'interventions#index'
  #get '/interventions/get_building', as: '/get_building'
  #get '/interventions/get_battery', as: '/get_battery'
  #get '/interventions/get_column', as: '/get_column'
  #get '/interventions/get_elevator', as: '/get_elevator'
  
  resources :interventions do
    get :get_building, on: :collection
    get :get_battery, on: :collection
    get :get_column, on: :collection
    get :get_elevator, on: :collection
  end

  # get '/intervention2', to: 'pages#intervention2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

end
