require "chinese_pinyin"
class Car::Brand < ApplicationRecord
    has_many :series

    before_create :gen_abbr
    def gen_abbr
        abbr = Pinyin.t(name.first).titlecase[0]
    end

    #传入name,返回id,如果不存在则新建
    # Car::Brand.get_cache_id_by_name(name)
    def self.get_cache_id_by_name(name)

        cache_key = "1-brand_id_#{name}"

        if Rails.cache.read(cache_key).present?
            brand_id =  Rails.cache.read(cache_key)
        else
            brand = Car::Brand.find_by(name:name) rescue ''
            if brand.nil?
                abbr = Pinyin.t(name.first).titlecase[0]
                brand_id = Car::Brand.create(name:name, abbr:abbr).id
            else
                brand_id = brand.id
            end

            Rails.cache.write(cache_key, brand_id)
        end
        brand_id
    end

end
