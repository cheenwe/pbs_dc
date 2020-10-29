class Car::Config < ApplicationRecord
    # belongs_to :item

    #传入name,返回id,如果不存在则新建
    # Car::Config.get_cache_id_by_name(name)
    def self.get_cache_id_by_name(name)
        cache_key = "1-config_id_#{name}"
        if Rails.cache.read(cache_key).present?
            detail_id =  Rails.cache.read(cache_key)
        else
            detail = Car::Config.where(name:name).last rescue ''
           if detail
            detail_id = detail.id rescue ''
           else
            detail = Car::Config.create(name:name)
            detail_id = detail.id
           end
           Rails.cache.write(cache_key, detail_id)
           return detail_id
        end
    end
end

