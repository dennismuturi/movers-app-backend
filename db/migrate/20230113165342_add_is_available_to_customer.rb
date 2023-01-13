class AddIsAvailableToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :is_available, :boolean
  end
end
