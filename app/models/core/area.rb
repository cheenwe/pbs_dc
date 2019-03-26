class Core::Area < ApplicationRecord
    second_level_cache expires_in: 1.year

    belongs_to :city, class_name: "Core::City", foreign_key: :city_code

    has_many :streets, class_name: "Core::Street", foreign_key: :area_code
end
