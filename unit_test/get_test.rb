# Command get test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# get(keys) The keys should be spaced and sent as a String
# get returns a hash with the memcached keys as the key and the value.
# Trying to get only one key with value
cache.flush
cache.set("TheKey","The value")
puts cache.get("TheKey")
# Trying to get multiple values with get
cache.set("TheSecondKey","Some value")
cache.set("ThirdKey","eulav emoS")
puts cache.get("TheKey TheSecondKey ThirdKey")
cache.flush
# Trying to get a non existent key
puts cache.get("NonExistentKey") # returns a nil key and "" As value
