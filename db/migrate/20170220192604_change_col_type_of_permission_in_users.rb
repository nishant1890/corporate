class ChangeColTypeOfPermissionInUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :permission, :string
    add_column :users, :permission, :text, array: true, default: []
  end
end
