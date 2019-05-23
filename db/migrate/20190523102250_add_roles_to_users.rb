class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin
    add_column :users, :role, :integer, default: 1

    User.find_each do |user|
      user.role = User::AUTHOR
      user.save!
    end
    admin = User.first
    admin.role = User::ADMIN
    admin.save!
  end
end
