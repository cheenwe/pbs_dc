class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def uuid
    return SecureRandom.uuid.gsub('-', '')
  end


  #  根据 id 获取 name 值并缓存,减少 where 查询
  def self.get_name(id, force=true, name=-1)
    # p '>>>>'
    # p self.model_name
      cache_key = "#{self.model_name.plural}_name#{id}"
      data = Rails.cache.read(cache_key)
      unless data.present? && force
          data=(name == -1)? (self.find(id).name rescue ''):name
          Rails.cache.write(cache_key, data)
      end
      return data
  end


  # 获取当前表的数据总数，每次创建或删除时更新缓存。 TODO
  # TODO
  def self.total_entries
      cache_key = "#{self.model_name.plural}_total"
      data = Rails.cache.read(cache_key)
      unless data.present?
          data=self.all.size
          Rails.cache.write(cache_key, data)
      end
      return data
  end
end
