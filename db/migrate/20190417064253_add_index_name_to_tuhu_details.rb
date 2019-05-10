class AddIndexNameToTuhuDetails < ActiveRecord::Migration[5.2]
  def change
    add_index :tuhu_products, :name
  end
end
