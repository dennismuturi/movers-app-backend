class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
