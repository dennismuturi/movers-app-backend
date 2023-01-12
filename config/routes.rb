Rails.application.routes.draw do
  get 'movers/mover'
  resources :customers
  resources :customer_orders
  post 'movers/signup', to: 'movers#create'
  post 'customer/signup', to: 'customers#create'

  resources :vehicles
  resources :movers do
      resources :vehicles
  end
 

    get '/login', to: 'sessions#new', as: 'login'
    post '/movers/login', to: 'movers/sessions#create'
    delete 'movers/logout', to: 'sessions#destroy'
    # other routes for the movers namespace

  # Customers routes

    get 'customers/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
