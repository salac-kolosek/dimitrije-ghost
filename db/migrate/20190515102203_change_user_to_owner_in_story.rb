class ChangeUserToOwnerInStory < ActiveRecord::Migration[5.2]
  def change
    remove_reference :stories, :user, index: true, foreign_key: true
    add_reference :stories, :owner, foreign_key: { to_table: :users }
  end
end
