Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  get 'admin/index'
 

 root "pages#home"
 get "dashboard", to: "pages#index" ,as: 'dashboard'
 resources :tenants
 resources :tickets

end
