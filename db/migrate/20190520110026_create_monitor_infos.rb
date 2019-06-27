class CreateMonitorInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :monitor_infos do |t|
      t.integer :server_id
      t.text :info
      t.string :remark

      t.timestamps
    end
    add_index :monitor_infos, :server_id
  end
end
