class Tyc::Industry < ApplicationRecord
    def self.create_or_find_by_name(name)
        industry = Tyc::Industry.where(name: name)
        if industry.present?
            industry = industry.last
        else
            industry = Tyc::Industry.create!(name: name)
        end
        return industry.id
    end
end
