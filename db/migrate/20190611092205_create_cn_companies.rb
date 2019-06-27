class CreateCnCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :cn_companies do |t|
      t.string :name
      t.string :code
      t.string :regdate
      t.string :c_type
      t.string :boss
      t.string :capital
      t.text :business_scope
      t.string :province
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
