class Cg::Gonggao < ApplicationRecord
	belongs_to :key, class_name: "Cg::Key", :foreign_key => :key_id

    has_and_belongs_to_many :kinds, class_name: "Cg::Kind"

    after_create :generate_kind

    # Cg::Gonggao.new.check_kind
    def check_kind
        Cg::Gonggao.all.each do |item|
            item.generate_kind
        end
    end

    def generate_kind
        self.kind.split("/").each do |kind|
            kind_id = Cg::Kind.check_kind(kind)
            Cg::GonggaosKind.create(kind_id: kind_id, gonggao_id: self.id)
        end if self.kind !=""
    end


	# Cg::Gonggao.get_areas
	def self.get_areas
		cache_key = "qgonggao_areas"
        data = Rails.cache.read(cache_key)
		if data.nil?
            data = Cg::Gonggao.all.map{|e|e.area}.uniq
			Rails.cache.write(cache_key, data, expires_in: 2.days)
		end

		return data
    end
    
    
end
