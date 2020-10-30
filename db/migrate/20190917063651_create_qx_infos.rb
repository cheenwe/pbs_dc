class CreateQxInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :qx_infos do |t|
      t.string :name
      t.datetime :up_at
      t.datetime :down_at

      t.timestamps
    end unless table_exists? :qx_infos
  end
end
