class CreateTuhuDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tuhu_details do |t|
      t.integer :version_id
      t.string :url
      t.string :remark

      t.timestamps
    end
  end
end
