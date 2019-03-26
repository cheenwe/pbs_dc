class AddUsedToTycCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :tyc_companies, :used, :integer, default:0
    add_index :tyc_companies, :used
  end
end
