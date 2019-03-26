
$redis = Redis::Namespace.new("cache_data", :redis => Redis.new)

# $redis.set("aa", "Hello World!")
# $redis.get("aa")


