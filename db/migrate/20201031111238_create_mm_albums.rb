class CreateMmAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :mm_albums do |t|
      t.integer :user_id
      t.string :name
      t.float :total
      t.integer :kind
      t.datetime :created_at
    end
  end
end
