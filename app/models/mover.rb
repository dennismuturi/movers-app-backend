class Mover < ApplicationRecord
    has_secure_password
    has_many :vehicles, dependent: :destroy
end