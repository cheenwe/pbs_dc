class CreateChe300Infos < ActiveRecord::Migration[5.2]
  def change
    create_table :che300_infos do |t|
      t.text :remark

      t.timestamps
    end
  end
end
