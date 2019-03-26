class ChangeOperateScopeToTycCompanies < ActiveRecord::Migration[5.2]
  def change
    change_column :tyc_companies, :operate_scope, :text
  end
end
