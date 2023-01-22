class AddLocationToCustomerOrdersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :customer_orders, :pickup, :string
    add_column :customer_orders, :destination, :string
  end
end
