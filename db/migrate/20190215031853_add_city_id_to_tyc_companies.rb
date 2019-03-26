class AddCityIdToTycCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :tyc_companies, :city_id, :integer
  end
end
