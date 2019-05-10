class Tuhu::Version < ApplicationRecord
  scope :today, -> {where("created_at >? ", Date.today)}

  belongs_to :brand, class_name: "Tuhu::Brand"#, foreign_key: :user_id

end
