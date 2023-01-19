class CustomerOrderSerializer < ActiveModel::Serializer
  attributes :id, :order_date, :delivery_date, :customer_id, :mover_id, :price_id, :customer, :mover
  belongs_to :customer
  belongs_to :mover
end
