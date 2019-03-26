class CreateTycHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :tyc_humen do |t|
      t.integer :company_id
      t.string :name
      t.string :code
      t.string :job

      t.timestamps
    end
  end
end
