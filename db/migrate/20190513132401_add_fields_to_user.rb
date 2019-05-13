class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :slug, :string
    add_column :users, :bio, :text
  end
end
