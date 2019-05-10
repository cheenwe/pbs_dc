class CreateTuhuBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :tuhu_brands do |t|
      t.string :name
      t.string :logo
      t.string :abbr
      t.string :reamrk

      t.timestamps
    end
  end
end
