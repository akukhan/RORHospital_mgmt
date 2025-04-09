
Rails.application.routes.draw do
  # Patient authentication (needs to be first)
  devise_for :patient_users, 
    path: 'patient_portal',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: {registrations: 'patient_portal/registrations'}
  
  # Staff/doctor authentication
  devise_for :users
  
  # Patient Portal routes - this will be protected by patient_user authentication
  namespace :patient_portal do   
    
    # Keep these routes
    get 'dashboard', to: 'dashboard#index'
    resources :appointments, only: [:index, :new, :create, :show]
  end
  
  # Routes for staff to create patient accounts
  get '/patients/:patient_id/new_account', to: 'patient_registrations#new_account', as: 'patient_new_account'
  post '/patients/:patient_id/create_account', to: 'patient_registrations#create_account', as: 'patient_create_account'
  get 'new_account', to: 'patient_registrations#new_account'
  post 'create_account', to: 'patient_registrations#create_account'
  
  # Doctor routes - these should be protected by user authentication
  get 'doctor/dashboard', to: 'doctor#dashboard', as: 'doctor_dashboard'
  get 'doctor/schedule', to: 'appointments#doctor_schedule', as: 'doctor_schedule'
  
  # Standard resources
  resources :patients 
  resources :appointments
  
  # Root route
  root to: 'home#index'
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
