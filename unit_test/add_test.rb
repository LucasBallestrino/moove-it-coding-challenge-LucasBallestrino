# Command add test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# add(key,value,exptime,flags) add returns memchached response to the command as String.
# Trying to add a key successfully
cache.flush
add_result = cache.add("TheKey","Value")
puts "Trying to add a key successfully
#{add_result}

"
puts cache.get("TheKey")
#Trying to add an existing key
add_result = cache.add("TheKey","Another value")
puts "
Trying to add an existing key
#{add_result}

"
puts cache.get("TheKey") # This should get the previous key and value
