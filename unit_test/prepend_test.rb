# Command prepend test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# prepend(key,value) prepend returns memchached response to the command as String.cache.flush
# Trying to prepend a value successfully
cache.set("TheKey","Value")
puts cache.get("TheKey")
prepend_result = cache.prepend("TheKey","string to be prepended ")
puts "
prepend result
#{prepend_result}

"
puts cache.get("TheKey")
# Trying to prepend to a non existing key
cache.flush
prepend_result = cache.prepend("TheKey","Value")
puts "
prepend result
#{prepend_result}

"
puts cache.get("TheKey")
# Trying to prepend to an expired key
cache.set("TheKey","Value",1)
sleep 2
prepend_result = cache.prepend("TheKey","Value")
puts "
prepend result
#{prepend_result}

"
puts cache.get("TheKey")
