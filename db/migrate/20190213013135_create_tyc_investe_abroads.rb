class CreateTycInvesteAbroads < ActiveRecord::Migration[5.2]
  def change
    create_table :tyc_investe_abroads do |t|
      t.integer :company_id
      t.integer :abroadd_company_id

      t.timestamps
    end
  end
end
