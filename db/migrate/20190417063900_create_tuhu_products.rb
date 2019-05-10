class CreateTuhuProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tuhu_products do |t|
      t.integer :kind_id
      t.string :img
      t.string :name
      t.string :price
      t.string :category
      t.string :url
      t.string :remark

      t.timestamps
    end
  end
end
