class AddIndexToCnCompanies < ActiveRecord::Migration[5.2]
  def change
    add_index :cn_companies, :used

  end
end
