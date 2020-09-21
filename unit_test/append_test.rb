# Command append test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# append(key,value) append returns memchached response to the command as String.
cache.flush
# Trying to append a value successfully
cache.set("TheKey","Value")
puts cache.get("TheKey")
append_result = cache.append("TheKey"," string to be appended")
puts "
Append result
#{append_result}

"
puts cache.get("TheKey")
# Trying to append to a non existing key
cache.flush
append_result = cache.append("TheKey","Value")
puts "
Append result
#{append_result}

"
puts cache.get("TheKey")
# Trying to append to an expired key
cache.set("TheKey","Value",1)
sleep 2
append_result = cache.append("TheKey","Value")
puts "
Append result
#{append_result}

"
puts cache.get("TheKey")
