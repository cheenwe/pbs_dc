class Tuhu::ProductDetail < ApplicationRecord

  belongs_to :product, class_name: "Tuhu::Product"#, foreign_key: :user_id
  belongs_to :detail, class_name: "Tuhu::Detail", foreign_key: :detail_id
end
