Rails.application.routes.draw do

  resources :admins do
    resources :customers 
  end
  post "/signup", to: "admins#signup"
  post "/login", to: "admins#login"
  delete "/signout", to: "admins#signout"
  

  resources :customers
  resources :customer_orders
  post 'signup_mover', to: 'movers#create'
  post 'signup_customer', to: 'customers#create'

  resources :vehicles
  
  resources :movers do
      resources :vehicles
  end
 
  get '/auto_login_customer', to: 'customers#auto_login_customer'
  get '/auto_login_mover', to: 'movers#auto_login_mover'
  
      post '/mover_login', to: 'sessions#mover_login'
      delete 'movers/logout', to: 'sessions#destroy'
      # other routes for the movers namespace
  # Customers routes

    post '/customer_login', to: 'sessions#customer_login'
    delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
