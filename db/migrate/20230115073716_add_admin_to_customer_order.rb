class AddAdminToCustomerOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :customer_orders, :admin, null: false, foreign_key: true, :default => 1
  end
end
