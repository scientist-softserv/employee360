class ChangeRoleToRolesInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role
    add_column :users, :roles, :string, array: true, default: []
  end
end
