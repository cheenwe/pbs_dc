class Tyc::City < ApplicationRecord
    def self.create_or_find_by_name(name)
        city = Tyc::City.where(name:name)
        if city.present?
            city = city.last
        else
            city = Tyc::City.create!(name:name)
        end
        return city.id
    end
end
