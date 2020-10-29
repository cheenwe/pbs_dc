class Qx::Airport < ApplicationRecord

  validates_uniqueness_of :airport_4_code, :allow_blank => true, :allow_nil => true

  # validates :airport_4_code, uniqueness: true
  
  # validates_uniqueness_of :uid, :scope => :sign
	# qx_take_off_params[:airport_id]

	# Qx::Airport.get_airport_id(airport_4_code)
	def self.get_airport_id(airport_4_code)
		cache_key = "Airport_id_#{airport_4_code}"

		if Rails.cache.read(cache_key).present? 
		  data = Rails.cache.read(cache_key)
		else
		  data = Qx::Airport.find_by(airport_4_code: airport_4_code).id
		  Rails.cache.write(cache_key, data)
		end
		data
	end
end
