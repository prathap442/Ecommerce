class AddColumnToCoupon < ActiveRecord::Migration[5.1]
  def change
  	add_column :coupons,:url,:string
  end
end
