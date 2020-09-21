# Command cas test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# cas(key,value,cas,exptime,flags) cas returns memchached response to the command as String.
cache.flush
# Trying to store data successfully with cas
cache.set("TheKey","value")
puts cache.get("TheKey")
the_key = cache.gets("TheKey") # Using gets to get cas value
value = the_key["TheKey"] # Getting the hash value
value =  value.split(" ")
cas = value[2] # Getting the cas_unique
cas_result = cache.cas("TheKey","another value",cas)
puts "
cas result
#{cas_result}

"
puts cache.get("TheKey")
#Trying to send a random cas
cas_result = cache.cas("TheKey","third value" ,"435")
puts "
cas result
#{cas_result}

"
puts cache.get("TheKey")
# Trying to use an outdated cas_unique
the_key = cache.gets("TheKey") # Using gets to get cas value
value = the_key["TheKey"] # Getting the hash value
value =  value.split(" ")
cas = value[2] # Getting the cas_unique
cache.set("TheKey","the fourth value")
cas_result = cache.cas("TheKey","yet another value",cas)
puts "
cas result
#{cas_result}

"
puts cache.get("TheKey")
# Trying to store a value with cas in a non existent key with a random cas_unique
cas_result = cache.cas("aNonExistentKey","TheLastValue","242")
puts"
cas result
#{cas_result}

"
puts cache.get("aNonExistentKey")
