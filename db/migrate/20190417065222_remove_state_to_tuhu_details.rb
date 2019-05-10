class RemoveStateToTuhuDetails < ActiveRecord::Migration[5.2]
  def change

    change_column :tuhu_details, :state, :integer, default:0
  end
end
