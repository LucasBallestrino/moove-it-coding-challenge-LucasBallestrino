# Command gets test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# gets(keys) The keys should be spaced and sent as a String
# gets returns a hash with the memcached keys as the key and the value flags and cas_unique in a string.
# Trying to gets only one key with value
cache.flush
cache.set("TheKey","The value")
puts cache.gets("TheKey")
# Trying to gets multiple values with gets
cache.set("TheSecondKey","Some value")
cache.set("ThirdKey","eulav emoS")
puts cache.gets("TheKey TheSecondKey ThirdKey")
cache.flush
# Trying to gets a non existent key
puts cache.gets("NonExistentKey") # returns a nil key and "" As value
