class CreateOrderLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_line_items do |t|
      t.string :product_id
      t.integer :quantity
      t.integer :order_id
      t.float :price

      t.timestamps
    end
  end
end
