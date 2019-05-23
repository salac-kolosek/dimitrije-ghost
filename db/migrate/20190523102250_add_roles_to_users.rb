class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin
    add_column :users, :role, :integer, default: 1
  end
end
