class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :user_id
      t.integer :address_id
      t.float :total
      t.boolean :is_delivered

      t.timestamps
    end
  end
end
