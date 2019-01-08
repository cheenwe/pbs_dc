class CreateHzBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :hz_banks do |t|
      t.string :cn_date_year
      t.string :cn_date_month
      t.string :cn_date_day
      t.string :company
      t.string :card_number_1
      t.string :bank
      t.string :xingming
      t.string :card_number_2
      t.string :bank_branch
      t.string :cn_money
      t.string :en_money
      t.string :cn_date
      t.string :protocol_number
      t.string :bank_number
      t.string :address
      t.string :xingming_2
      t.string :en_date_year
      t.string :en_date_month
      t.string :en_date_day
      t.string :phone

      t.timestamps
    end
  end
end
