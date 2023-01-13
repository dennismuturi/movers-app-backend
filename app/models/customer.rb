class Customer < ApplicationRecord
    has_secure_password
    customer has many customer_orders
    customer has many movers through customer_orders
end
