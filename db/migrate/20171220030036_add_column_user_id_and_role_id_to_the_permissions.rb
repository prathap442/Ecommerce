class AddColumnUserIdAndRoleIdToThePermissions < ActiveRecord::Migration[5.1]
  def change
  	add_column :permissions,:role_id,:integer
  	add_column :permissions,:user_id,:integer
  end
end
