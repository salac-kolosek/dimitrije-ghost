class CreateSiteTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :site_titles do |t|
      t.string :title

      t.timestamps
    end
  end
end
