class CreateJzUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :jz_users do |t|
      t.string :code
      t.string :name
      t.string :phone
      t.string :alipay
      t.integer :rate
      t.string :remark
      t.integer :this_month_num

      t.timestamps
    end
  end
end
