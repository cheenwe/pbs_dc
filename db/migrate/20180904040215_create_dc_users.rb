class CreateDcUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dc_users do |t|
      t.string :uid
      t.integer :photo_num
      t.string :photo_hash
      t.string :sign
      t.string :info

      t.timestamps
    end
  end
end
