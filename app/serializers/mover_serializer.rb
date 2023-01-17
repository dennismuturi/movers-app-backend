class MoverSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :email, :is_available, :vehicles, :customer_orders
  has_many :vehicles
  has_many :customer_orders
end
