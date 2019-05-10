class Tuhu::Brand < ApplicationRecord
    scope :today, -> {where("created_at >? ", Date.today)}
end
