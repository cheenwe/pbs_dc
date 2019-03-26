class CreateTycCids < ActiveRecord::Migration[5.2]
  def change
    create_table :tyc_cids do |t|
      t.integer :city_id
      t.integer :state
      t.string :number

      t.timestamps
    end
  end
end
