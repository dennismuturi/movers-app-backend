class CustomerOrderSerializer < ActiveModel::Serializer
  attributes :id, :order_date, :delivery_date, :customer_id, :mover_id, :price_id
end
