class AddStateToTuhuDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :tuhu_details, :state, :integer
    add_index :tuhu_details, :state
  end
end
