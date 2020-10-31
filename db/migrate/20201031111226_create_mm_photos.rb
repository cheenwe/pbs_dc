class CreateMmPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :mm_photos do |t|
      t.integer :album_id
      t.string :name
      t.string :url
      t.integer :kind

      t.datetime :created_at
    end
  end
end
