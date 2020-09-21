# Command replace test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# replace(key,value,exptime,flags) replace returns memchached response to the command as String.
cache.flush
#Trying to replace successfully
cache.set("TheKey","Value")
puts cache.get("TheKey")
replace_result = cache.replace("TheKey","Another value")
puts "
Replace result
#{replace_result}

"
puts cache.get("TheKey")
#Trying to replace a non existing key
cache.flush
replace_result = cache.replace("TheKey","A third value")
puts "
Second replace result
#{replace_result}

"
puts cache.get("TheKey") #This should return a nil value
