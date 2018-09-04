class CreateDcPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :dc_photos do |t|
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
