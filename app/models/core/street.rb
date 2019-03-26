class Core::Street < ApplicationRecord
    second_level_cache expires_in: 1.year
    belongs_to :area, class_name: "Core::Area", foreign_key: :area_code
    has_many :villages, class_name: "Core::Village", foreign_key: :street_code
end
