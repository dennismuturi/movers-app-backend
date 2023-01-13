class Customer < ApplicationRecord
<<<<<<< HEAD
    has_secure_password
    has_many :customer_orders
    has_many :movers, through: :customer_orders
=======
     has_many :customer_orders
     has_many :movers, through: :customer_orders
>>>>>>> b7f8c6e (fixed customer post)
end
