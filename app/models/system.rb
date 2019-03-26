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
end

# System.cached(key, value)
# $redis.set(key, value)

# System.cached(key)
# $redis.get(key)