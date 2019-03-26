class Tyc::Cid < ApplicationRecord
    
    scope :used, -> { where(state:1)}
    scope :unused, -> { where(state:0)}
end
