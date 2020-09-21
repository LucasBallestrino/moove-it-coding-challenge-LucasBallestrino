# Command incr test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# incr(key,value) Value should be a numeric, also the value stored in the server should be numeric.
# Trying to increment a value successfully
cache.set("TheKey","1")
puts cache.get("TheKey")
incr_result = cache.incr("TheKey","1") # the result should be the new value stored in the server
puts "
incr result
#{incr_result}

"
puts cache.get("TheKey")
# Trying to increment a value of a non existent key
cache.flush
incr_result = cache.incr("NonExistentKey","1")
puts "
incr result
#{incr_result}

"
puts cache.get("NonExistentKey")
# Trying to increment a alphanumeric value
cache.flush
cache.set("RealKey","some text")
incr_result = cache.incr("RealKey","1")
puts "
incr result
#{incr_result}

"
puts cache.get("NonExistentKey")
