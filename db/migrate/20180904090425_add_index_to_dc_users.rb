class AddIndexToDcUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :dc_users, :uid
  end
end
