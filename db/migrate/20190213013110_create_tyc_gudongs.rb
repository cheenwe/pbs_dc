class CreateTycGudongs < ActiveRecord::Migration[5.2]
  def change
    create_table :tyc_gudongs do |t|
      t.integer :company_id
      t.integer :human_id
      t.string :invest_rate
      t.string :invest_amount

      t.timestamps
    end
  end
end
