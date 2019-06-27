class ChangeColumnsToCnCompanies < ActiveRecord::Migration[5.2]
  def change
    rename_column :cn_companies, :regdate, :registrationDay
    rename_column :cn_companies, :c_type, :character
    rename_column :cn_companies, :boss, :legalRepresentative
    rename_column :cn_companies, :business_scope, :businessScope

    change_column :cn_companies, :province, :string

    remove_column :cn_companies, :created_at
    remove_column :cn_companies, :updated_at
  end
end
