Rails.application.routes.draw do

  resources :admins do
    resources :customers 
  end
  post "/signup", to: "admins#signup"
  post "/login", to: "admins#login"
  delete "/signout", to: "admins#signout"
  

  get 'movers/mover'
  resources :customers
  resources :customer_orders
  post 'signup_mover', to: 'movers#create'
  post 'signup_customer', to: 'customers#create'

  resources :vehicles
  
  resources :movers do
      resources :vehicles
  end
 

    post '/mover/login', to: 'sessions#mover_login'
    delete 'mover/logout', to: 'sessions#destroy'
    # other routes for the movers namespace

  # Customers routes

    post '/customer/login', to: 'sessions#customer_login'
    delete '/customer/logout', to: 'sessions#destroy', as: 'logout'


    #new Auth

    post '/customerlogin', to: 'auth#create'
    delete '/customerlogout/:id', to: 'auth#destroy'



    post '/moverlogin', to: 'auth#create_mover'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
