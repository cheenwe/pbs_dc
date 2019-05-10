class CreateTuhuProdocts < ActiveRecord::Migration[5.2]
  def change
    create_table :tuhu_prodocts do |t|
      t.integer :detail_id
      t.integer :kind_id
      t.string :name
      t.string :price
      t.string :category
      t.string :url
      t.string :remark

      t.timestamps
    end
  end
end
