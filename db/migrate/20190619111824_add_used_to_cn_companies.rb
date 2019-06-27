class AddUsedToCnCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :cn_companies, :used, :integer
  end
end
