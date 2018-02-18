class ChangeColumnTypeDescriptionProductsString < ActiveRecord::Migration[5.1]
  def change
  	change_column :products,:description,:string
  end
end
