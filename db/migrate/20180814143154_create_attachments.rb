class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :uuid
      t.string :qrcord
      t.string :zip_url
      t.string :short_url

      t.timestamps
    end
  end
end
