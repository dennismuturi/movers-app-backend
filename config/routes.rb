Rails.application.routes.draw do
  get 'movers/mover'
  resources :customers
  resources :customer_orders
  post 'signup_mover', to: 'movers#create'
  post 'signup_customer', to: 'customers#create'

  resources :vehicles
  
  resources :movers do
      resources :vehicles
  end
 

    post '/movers/login', to: 'sessions#mover_login'
    delete 'movers/logout', to: 'sessions#destroy'
    # other routes for the movers namespace

  # Customers routes

    post '/login', to: 'sessions#customer_login'
    delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
