# require "rest-client"

class System
    # System.cache_id(key, default_value)
    def self.cache_id(key, default_value = 1)
        old_value = $redis.get(key)
        if old_value.nil?
          value = default_value
        else
          value = old_value.succ
        end
        $redis.set(key, value)
        return value
    end


    # System.cached(key, value)
    def self.cached(key, value=1)
        if value == 1
            value = $redis.get(key)
        else
            $redis.set(key, value)
            value = "ok"
        end
        return value
    end

  class << self
    STR="01234567890abcedfghjklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    # 传入一个字符，返回其下一位
    def next_str(str)
      case str
      when "9"
        str = "a"
      when "z"
        str = "A"
      when "Z"
        str = "0"
      else
        str.succ
      end
    end

    def gen_next(code)
      start_str = code[0]
      end_str = code[-1]
      end_str = next_str(end_str)
      if end_str == "0"
        start_str = next_str(start_str)
      end
      code = "#{start_str}#{end_str}"
    end

    def gen_next2(code)
      start_str = code[0..-2]
      end_str = code[-1]
      end_str = next_str(end_str)
      if end_str == "0"
        start_str = gen_next(start_str)
      end
      code = "#{start_str}#{end_str}"
    end

    # 生成2位字符的文件夹，3844  62*62
    def fd2(code = '00')
      (1..3850).each do |i|
        p code
        # system("mkdir /tmp/test/#{code}")
        code = gen_next(code)
      end
    end

    # System.fd3
    # 生成3位字符的文件夹 238328  62^3
    def fd3(code = '000')
      (1..10000).each do |i|
        p code
        # system("mkdir /tmp/test/#{code}")
        code = gen_next2(code)
      end
    end


    def gen_pic_name(num=6)
      ran_str = Random.urlsafe_base64[0...num]
      "#{ran_str}.jpg"
    end


    # 下载
    def download_image(url, file)
      retry_count = 0
      begin
        # puts "start download #{url}"
        f = open(file, 'wb')
        begin
          res = Net::HTTP.get(URI.parse(url))
          f.write(res)
          # puts ">>>> #{file}下载中 "
          sleep 0
        ensure
          f.close()
        end
      rescue Timeout::Error
        retry_count += 1
        if retry_count <= 3
          retry
        end
      rescue Errno::ECONNRESET
        retry_count += 1
        if retry_count <= 3
          sleep(5)
          retry
        end
      rescue => e
        retry_count += 1
        if retry_count <= 3
          retry
        end
      end
      if retry_count < 4
        return true
      else
        return false
      end
    end
  end
end

# System.cached(key, value)
# $redis.set(key, value)

# System.cached(key)
# $redis.get(key)
