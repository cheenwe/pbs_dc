class CreateMmUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :mm_users do |t|
      t.string :name
    end
  end
end
