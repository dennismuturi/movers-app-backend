Rails.application.routes.draw do
  resources :admins
  post "/signup", to: "admins#signup"
  post "/login", to: "admins#login"
  delete "/signout", to: "admins#signout"
  
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
