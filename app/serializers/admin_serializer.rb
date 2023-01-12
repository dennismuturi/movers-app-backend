class AdminSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :password, :customer_order_id
end
