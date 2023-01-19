class Mover < ApplicationRecord
    validates :company_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,uniqueness: true, length: { maximum: 255 },

    format: { with: VALID_EMAIL_REGEX },uniqueness: true
    
    validates :password, length: { minimum: 6 } 

    has_secure_password
    has_many :customer_orders, dependent: :destroy
    has_many :customers, through: :customer_orders
    has_many :vehicles, dependent: :destroy
   # belongs_to :admin
end
