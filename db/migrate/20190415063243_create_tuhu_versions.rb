class CreateTuhuVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :tuhu_versions do |t|
      t.integer :brand_id
      t.string :name
      t.string :abbr
      t.string :reamrk

      t.timestamps
    end
    add_index :tuhu_versions, :brand_id
  end
end
