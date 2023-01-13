class Admin < ApplicationRecord
    # has_secure_password
    # validates :email, presence: true 
    # validates :password, presence: true

    has_many :customers, through: :customer_orders
    has_many :movers, through: :customer_orders
end
