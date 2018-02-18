class CreateCartLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_line_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :user_id  
      t.timestamps
    end
  end
end
