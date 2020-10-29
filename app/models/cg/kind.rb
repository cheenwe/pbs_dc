class Cg::Kind < ApplicationRecord

  attr_accessor :selected
  has_and_belongs_to_many :gonggaos, class_name: "Cg::Gonggao"


    # Cg::Kind.check_kind(name)
    def self.check_kind(name)
      cache_key = "check_kind_new_#{name}"

      if Rails.cache.read(cache_key).present?
        kind_id = Rails.cache.read(cache_key)
      else
        kind = Cg::Kind.find_by(name:name) rescue ''
        if kind.nil?
          kind_id = Cg::Kind.create(name:name).id
        else
          kind_id = kind.id
        end
        Rails.cache.write(cache_key, kind_id)
      end
      kind_id
    end

    # Cg::Kind.check_kind(name)
    # def self.check_kind(name)
    #     cache_key = "check_kind_#{name}"

    #     if Rails.cache.read(cache_key).nil?
    #         data = Cg::Kind.where(name:name)
    #         if data.present?
    #           data = data.last
    #           # device.update(name:device_address)
    #         else
    #           data =  Cg::Kind.create!(
    #             name:name,
    #             )
    #         end
    #         Rails.cache.write(cache_key, data.id)
    #     end

    #     return data.id
    # end








    def false_info
      {
        id: id,
        name: name,
        selected: false,
      }
    end
end
