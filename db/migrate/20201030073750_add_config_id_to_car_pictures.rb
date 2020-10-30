class AddConfigIdToCarPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :car_pictures, :config_id, :integer
  end
end
