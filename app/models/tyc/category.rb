class Tyc::Category < ApplicationRecord
    def self.create_or_find_by_name(name)
        category = Tyc::Category.where(name:name)
        if category.present?
            category = category.last
        else
            category = Tyc::Category.create!(name:name)
        end
        return category.id
    end
end
