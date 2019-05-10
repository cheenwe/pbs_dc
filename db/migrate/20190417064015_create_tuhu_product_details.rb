class CreateTuhuProductDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tuhu_product_details do |t|
      t.integer :product_id
      t.integer :detail_id

      t.timestamps
    end
    add_index :tuhu_product_details, :product_id
    add_index :tuhu_product_details, :detail_id
  end
end
