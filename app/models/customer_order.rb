class CustomerOrder < ApplicationRecord
    validates :customer_id, presence: true
    validates :mover_id, presence: true

    belongs_to :admin 
    belongs_to :customer
    belongs_to :mover
end
