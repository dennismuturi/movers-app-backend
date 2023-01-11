class MoverSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :email, :is_available, :vehicles
  has_many :vehicles
end
