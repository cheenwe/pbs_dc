class CreateJzRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :jz_records do |t|
      t.integer :user_id
      t.datetime :enter_at
      t.boolean :is_first
      t.integer :computer_num
      t.string :remark

      t.timestamps
    end
  end
end
