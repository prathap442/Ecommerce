class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|

      t.timestamps
      t.string :name
      
    end
  end
end
