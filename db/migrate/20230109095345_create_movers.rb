class CreateMovers < ActiveRecord::Migration[7.0]
  def change
    create_table :movers do |t|
      t.string :company_name
      t.string :email
      t.string :password
      t.boolean :is_available

      t.timestamps
    end
  end
end
