class AddIdCardToJzUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :jz_users, :id_card, :string
  end
end
