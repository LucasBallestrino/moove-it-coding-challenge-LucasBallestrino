# Command decr test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# decr(key,value) Value should be a numeric, also the value stored in the server should be numeric.
# Trying to decrement a value successfully
cache.set("TheKey","1")
puts cache.get("TheKey")
decr_result = cache.decr("TheKey","1") # the result should be the new value stored in the server
puts "
decr result
#{decr_result}

"
puts cache.get("TheKey")
# Trying to decrement a value of a non existent key
cache.flush
decr_result = cache.decr("NonExistentKey","1")
puts "
decr result
#{decr_result}

"
puts cache.get("NonExistentKey")
# Trying to decrement a alphanumeric value
cache.flush
cache.set("RealKey","some text")
decr_result = cache.decr("RealKey","1")
puts "
decr result
#{decr_result}

"
puts cache.get("NonExistentKey")
# Trying to decrement a value of 0
cache.set("TheKey","0")
decr_result = cache.decr("TheKey","1")
puts "
decr result
#{decr_result}

"
puts cache.get("TheKey")
