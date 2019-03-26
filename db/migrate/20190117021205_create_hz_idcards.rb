class CreateHzIdcards < ActiveRecord::Migration[5.2]
  def change
    create_table :hz_idcards do |t|
      t.string :name
      t.string :sex
      t.string :nation
      t.date :birthday
      t.string :street
      t.string :number
      t.string :org
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
