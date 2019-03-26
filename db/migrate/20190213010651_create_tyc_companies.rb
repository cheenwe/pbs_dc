class CreateTycCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :tyc_companies do |t|
      t.string :code
      t.string :logo
      t.string :name
      t.string :old_name
      t.string :phone
      t.string :mail
      t.string :url
      t.string :address
      t.string :intro
      t.date :update_date
      t.string :boss_name
      t.string :reg_money
      t.string :set_date
      t.string :status
      t.string :reg_number
      t.string :credit_code
      t.string :company_code
      t.string :tax_code
      t.integer :category_id
      t.string :end_time
      t.integer :industry_id
      t.string :tax
      t.string :allow_time
      t.string :pay_money
      t.string :all_people
      t.string :insured_people
      t.string :organ
      t.string :reg_address
      t.string :en_name
      t.string :operate_scope

      t.timestamps
    end
  end
end
