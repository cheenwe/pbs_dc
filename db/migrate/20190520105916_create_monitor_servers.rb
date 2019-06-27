class CreateMonitorServers < ActiveRecord::Migration[5.2]
  def change
    create_table :monitor_servers do |t|
      t.string :name
      t.string :ip
      t.string :remark

      t.timestamps
    end
  end
end
