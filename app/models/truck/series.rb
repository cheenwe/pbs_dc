class Truck::Series < ApplicationRecord
    has_many :items
    belongs_to :brand, class_name: "Truck::Brand", foreign_key: :brand_id

    #传入name,返回id,如果不存在则新建
    # Truck::Serie.get_cache_id_by_name(name)
    def self.get_cache_id_by_name(name,brand_id)

        cache_key = "2-serie_id_#{brand_id}_#{name}"

        if Rails.cache.read(cache_key).present?
            serie_id =  Rails.cache.read(cache_key)
        else
            serie = Truck::Serie.where(name:name,brand_id:brand_id).last rescue ''
            if serie

                serie_id = serie.id 
                Rails.cache.write(cache_key, serie_id)
                serie_id
            end
        end
    end
end
