class RemoveCustomerOrderIdFromAdminTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :customer_order_id, :integer
  end
end
