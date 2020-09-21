# Command flush test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# flush(time) time is 0 by default, if time is empty all values are deleted instantly
# flush with time 0
cache.set("TheKey","value")
puts cache.get("TheKey")
flush_result = cache.flush
puts "
flush result
#{flush_result}

"
puts cache.get("TheKey")
puts ""
cache.set("NewKey","some value")
puts cache.get("NewKey")
cache.flush("2") # this should remove all keys in 2 seconds
puts cache.get("NewKey")
sleep 3
puts cache.get("NewKey")
