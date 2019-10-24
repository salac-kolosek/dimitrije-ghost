class UserIdColumn < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :story, foreign_key: true
  end
end
