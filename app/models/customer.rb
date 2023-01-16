class Customer < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },

    format: { with: VALID_EMAIL_REGEX },uniqueness: true
    
    validates :password, length: { minimum: 6 } 

    has_many :customer_orders
    has_many :movers, through: :customer_orders
    
    has_secure_password

 
end
