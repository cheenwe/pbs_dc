class Cg::Key < ApplicationRecord

	belongs_to :gonggao, class_name: "Cg::Gonggao"

	# Cg::Key.get_key_id(name)
	def self.get_key_id(name)
		cache_key = "Key_ids_#{name}"

		if Rails.cache.read(cache_key).present?
			key_id = Rails.cache.read(cache_key)
		else
			key = Cg::Key.find_by(name:name) rescue ''
			if key.nil?
			  key_id = Cg::Key.create(name:name).id
			else
				key_id = key.id
			end
			Rails.cache.write(cache_key, key_id)
		end
		key_id
	end
end