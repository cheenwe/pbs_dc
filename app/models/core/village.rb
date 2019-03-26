class Core::Village < ApplicationRecord
    second_level_cache expires_in: 1.year
    belongs_to :street, class_name: "Core::Street", foreign_key: :street_code

    def full_name
        name = street.area.city.province.name + street.area.city.name + street.area.name + street.name + self.name
        address =  name.remove("市辖区", "办事处", "居委会", "委员会", "自治区","社区居民", "委员会", "委会") + dizhi
        org = street.area.city.name
        code = street.area.code
        [org,code, address ]
        # "北京市市辖区东城区东华门街道办事处"
    end

    def shourt_full_name
      name = street.area.city.province.name + street.area.city.name + street.area.name + street.name + self.name
      address =  name.remove("市辖区", "办事处", "居委会", "委员会", "自治区","社区居民", "委员会", "委会") + short_dizhi
      org = street.area.city.name
      code = street.area.code
      [org,code, address ]
      # "北京市市辖区东城区东华门街道办事处"
    end

    # Core::Village.new.write_cache
    def write_cache
 
      Core::Village.all.find_in_batches(batch_size: 10000).each do |list|
        list.each do |item|
          name = item.street.area.city.province.name + item.street.area.city.name + item.street.area.name + item.street.name + item.name
          address =  name.remove("市辖区", "办事处", "居委会", "委员会", "自治区","社区居民", "委员会", "委会") + short_dizhi
          org = item.street.area.city.name
          code = item.street.area.code

          data =  "#{org}, #{code}, #{address}"
          $redis.set("v-#{item.code}", data)
        end
      end
  
    end


    def new_shourt_full_name

      key = "v-#{self.code}"
      p key
      $redis.get(key).split(',')
      # $redis.get("v-#{self.code}").split(',')
      # name = street.area.city.province.name + street.area.city.name + street.area.name + street.name + self.name
      # address =  name.remove("市辖区", "办事处", "居委会", "委员会", "自治区","社区居民", "委员会", "委会") + short_dizhi
      # org = street.area.city.name
      # code = street.area.code
      # [org,code, address ]
      # "北京市市辖区东城区东华门街道办事处"
    end

    # Core::Village.get_shourt_full_name(code)
    def self.get_shourt_full_name(code)
      key = "v-#{code}"
      $redis.get(key).split(',')
      # name = street.area.city.province.name + street.area.city.name + street.area.name + street.name + self.name
      # address =  name.remove("市辖区", "办事处", "居委会", "委员会", "自治区","社区居民", "委员会", "委会") + short_dizhi
      # org = street.area.city.name
      # code = street.area.code
      # [org,code, address ]
      # "北京市市辖区东城区东华门街道办事处"
    end


    # %w(幢 栋 弄 单元).sample(1)
    # Faker.number(3)
    def dizhi
      a = %w(幢 栋 弄 单元).sample(1).first
      "#{Faker.number(3)}#{a}#{Faker.number(2)}号"
  end

  def short_dizhi
      a = %w(幢 栋 弄 单元 号).sample(1).first
      "#{Faker.number(3)}#{a}"
  end

    # code = Core::Village.pluck(:code).sample(1)
    # Core::Village.find_by_code(code)
    # Core::Village.new.random_one
  def random_one
    p Rails.cache.read('all_codes')

    if Rails.cache.read('all_codes').nil?
      codes = Core::Village.pluck(:code)
      Rails.cache.write('all_codes',codes )
      # codes =  Rails.cache.read('all_codes')
    else
      codes =  Rails.cache.read('all_codes')
    end

    # p codes

    code = codes.sample(1)
    return Core::Village.find_by_code(code)
  end

  

end
