class Core::City < ApplicationRecord
    second_level_cache expires_in: 1.year
    belongs_to :province, class_name: "Core::Province", foreign_key: :province_code
    has_many :areas, class_name: "Core::Area", foreign_key: :city_code

    #Core::City.short_name
    def self.short_name
        a = Core::City.all.sample.name
        if a.size < 5 && a != "市辖区"
            a
        else
            short_name
        end
    end
end
