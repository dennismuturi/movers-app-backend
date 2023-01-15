class AdminSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :password, :customer_orders
  has_many :customer_orders
   
end
