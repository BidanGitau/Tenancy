Rails.application.routes.draw do
 root "pages#home"
 get "property", to: "pages#index"
 resources :tenants
 resources :tickets
 get "login", to: "sessions#new"
 post "login", to: "sessions#create"
 delete "logout", to: "sessions#destroy"
end
