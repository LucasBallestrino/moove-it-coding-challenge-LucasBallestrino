# Command set test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# set(key,value,exptime,flags) set returns memchached response to the command as String.
set_result = cache.set("TheKey","The Value") # If exptime and flags are empty these have a default value of "0".
puts "
#{set_result}

"
puts cache.get("TheKey")
# Testing exptime
cache.set("TheKey2","Value",1)
puts cache.get("TheKey2")
sleep 2
puts cache.get("TheKey2")
#Trying to get an error message from set
set_result = cache.set("key 1","value")
puts "
#{set_result
}"
