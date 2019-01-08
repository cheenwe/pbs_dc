class CreateUids < ActiveRecord::Migration[5.2]
  def change
    create_table :uids do |t|
      t.bigint :number
      t.string :remark

      t.timestamps
    end
  end
end
