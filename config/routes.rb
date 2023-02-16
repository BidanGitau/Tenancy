Rails.application.routes.draw do
    resources :properties
    resources :tenants
    namespace :tenants do
      devise_scope :tenant do
        get    '/login',  to: 'sessions#new',     as: :new_session
        post   '/login',  to: 'sessions#create',  as: :session
        delete '/logout', to: 'sessions#destroy', as: :destroy_session
      end
    end
  
    devise_for :users, controllers: { registrations: "registrations" }
    get 'admin/index'
  
    resources :units
    root "pages#home"
    get "dashboard", to: "pages#index" ,as: 'dashboard'
    resources :units do
      resources :payments
    end
    resources :tickets
  end
  
