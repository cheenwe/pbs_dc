class Jz::Sx < ApplicationRecord
    belongs_to :user, class_name: "Jz::User"
    scope :today, -> { where("created_at >?",Time.now.beginning_of_day ) }
end
