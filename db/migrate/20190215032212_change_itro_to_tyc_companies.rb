class ChangeItroToTycCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :tyc_companies, :intro, :text
  end
end
