class CreateJzSxes < ActiveRecord::Migration[5.2]
  def change
    create_table :jz_sxes do |t|
      t.integer :user_id
      t.string :name
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
