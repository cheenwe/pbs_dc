class Qx::Landing < ApplicationRecord

	validates_uniqueness_of :runway, :scope => [:airport_id, :come_near_type, :c_kind]


    belongs_to :airport, class_name: "Qx::Airport", foreign_key: :airport_id
end
