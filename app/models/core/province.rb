class Core::Province < ApplicationRecord
  second_level_cache expires_in: 1.year
  has_many :cities, class_name: "Core::City", foreign_key: :province_code
end
