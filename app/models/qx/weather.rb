class Qx::Weather < ApplicationRecord
	
    validates_uniqueness_of :hour_tag, :scope => [:airport_id, :state]

    belongs_to :airport, class_name: "Qx::Airport", foreign_key: :airport_id
end
