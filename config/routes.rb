Rails.application.routes.draw do
  resources :admins

  resources :customers

  resources :customer_orders
  resources :vehicles
  resources :movers do
      resources :vehicles
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
