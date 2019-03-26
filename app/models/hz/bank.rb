class Hz::Bank < ApplicationRecord
    second_level_cache expires_in: 1.year
end
