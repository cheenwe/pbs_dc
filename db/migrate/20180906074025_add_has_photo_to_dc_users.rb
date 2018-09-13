class AddHasPhotoToDcUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :dc_users, :has_photo, :boolean
  end
end
