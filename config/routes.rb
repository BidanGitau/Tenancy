Rails.application.routes.draw do
  get 'admin/index'
  get 'members/index'
  get 'members/new'
  get 'members/edit'
  get 'members/show'
 root "pages#home"
 get "property", to: "pages#index"
 resources :tenants
 resources :tickets
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 delete "logout", to: "sessions#destroy"
end
