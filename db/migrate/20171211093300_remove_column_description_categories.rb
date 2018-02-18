class RemoveColumnDescriptionCategories < ActiveRecord::Migration[5.1]
  def change
  	remove_column :categories,:description
  end
end
