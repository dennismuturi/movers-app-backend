class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders do |t|
      t.date :order_date
      t.date :delivery_date
      t.integer :customer_id
      t.integer :mover_id
      t.integer :price_id

      t.timestamps
    end
  end
end
