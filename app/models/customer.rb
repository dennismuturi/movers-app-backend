class Customer < ApplicationRecord
    customer has many customer_orders
    customer has many movers through customer_orders
end
