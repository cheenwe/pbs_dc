class Mm::Album < ApplicationRecord
  has_many :photos, class_name: "Mm::Photo"
end
