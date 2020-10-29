class Qx::Runway < ApplicationRecord
	validates_uniqueness_of :name, :scope => :airport_id

    belongs_to :airport, class_name: "Qx::Airport", foreign_key: :airport_id



	def self.get_runay_id(airport_id, name)
		cache_key = "Runway_#{airport_id}_#{name}"

		if Rails.cache.read(cache_key).present? 
		  id = Rails.cache.read(cache_key)
		else
		  data = Qx::Runway.where(airport_id:airport_id).last rescue ''
		  if !data.present?
		  	data = Qx::Runway.create(
		  		airport_id:airport_id,
		  		name:name,
		  	)
		  end
		  id =  data.id
		  Rails.cache.write(cache_key,id)
		end
		id
	end

end