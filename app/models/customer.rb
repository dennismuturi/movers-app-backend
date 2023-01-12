class Customer < ApplicationRecord
    has_many :customer_orders
    has_many :movers, through: :customer_orders
    belongs_to :admin
end
