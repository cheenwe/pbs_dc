class Tuhu::Detail < ApplicationRecord

  scope :today, -> {where("created_at >? ", Date.today)}
  scope :used, -> { where(state:1)}
  scope :unused, -> { where(state:0)}

  belongs_to :version, class_name: "Tuhu::Version"#, foreign_key: :user_id
  has_many :product_details
  has_many :products, through: :product_details

end
