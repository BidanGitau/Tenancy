Rails.application.routes.draw do
 resources :properties
  devise_for :users, controllers: { registrations: "registrations" }
  # devise_for :users, controllers: { invitations: 'tenants/invitations' }
  get 'admin/index'
 
  resources :units
 root "pages#home"
 get "dashboard", to: "pages#index" ,as: 'dashboard'
 resources :tenants
 resources :tickets

end
