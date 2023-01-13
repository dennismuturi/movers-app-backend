class Vehicle < ApplicationRecord
  validates :vehicle_name, presence: true
  validates :vehicle_type, presence: true
  validates :vehicle_color, presence: true
  validates :vehicle_number, presence: true
  validates :mover_id, presence: true
  belongs_to :mover
end
