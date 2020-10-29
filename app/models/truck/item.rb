class Truck::Item < ApplicationRecord
    has_many :details
    has_many :pictures
    belongs_to :serie, class_name: "Truck::Serie", foreign_key: :serie_id


    #传入name,返回id,如果不存在则新建
    # Truck::Item.get_cache_id_by_name(name)
    def self.get_cache_id_by_name(name,serie_id)
        cache_key = "2-item_id_#{serie_id}_#{name}"
        if Rails.cache.read(cache_key).present?
            item_id =  Rails.cache.read(cache_key)
        else
            item = Truck::Item.where(name:name,serie_id:serie_id).last rescue ''
            if item
            
                item_id = item.id rescue ''

                Rails.cache.write(cache_key, item_id)
                
                item_id

            end
        end
    end

    #传入code,返回id,如果不存在则新建
    # Truck::Item.get_cache_id_by_code(code)
    def self.get_cache_id_by_code(code)
        cache_key = "2-item_code_#{code}"
        if Rails.cache.read(cache_key).present?
            item_id =  Rails.cache.read(cache_key)
        else
            item = Truck::Item.where(code:code).last rescue ''
            if item
            
                item_id = item.id rescue ''

                Rails.cache.write(cache_key, item_id)
                
                item_id
                
            end
        end
    end
    
end
