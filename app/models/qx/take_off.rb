class Qx::TakeOff < ApplicationRecord
    validates_uniqueness_of :runway, :scope => [:airport_id, :aircraft_type]

    belongs_to :airport, class_name: "Qx::Airport", foreign_key: :airport_id
end
