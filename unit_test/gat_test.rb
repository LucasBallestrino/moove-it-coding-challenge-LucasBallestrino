# Command gat test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# gat(keys,exptime) The keys should be spaced and sent as a String
# gat returns a hash with the memcached keys as the key and the value.
# Trying to gat only one key with value
cache.set("TheKey","some value")
puts cache.get("TheKey")
puts cache.gat("TheKey","1")
sleep 2
puts cache.get("TheKey")
# Trying to gat with more than one key
cache.set("TheKey","some value")
cache.set("secondkey","some value2")
cache.set("thirdkey","some value3")
puts cache.gat("TheKey secondkey thirdkey","1")
sleep 2
puts cache.get("TheKey secondkey thirdkey")
cache.flush
cache.set("NewKey","some text here","1")
the_key = cache.gets("NewKey") # Using gets to get cas value
value = the_key["NewKey"] # Getting the hash value
value =  value.split(" ")
cas = value[2] # Getting the cas_unique
puts ""
puts cache.gat("NewKey","0")
the_key = cache.gets("NewKey") # Using gets to get cas value
value = the_key["NewKey"] # Getting the hash value
value =  value.split(" ")
new_cas = value[2] # Getting the cas_unique
puts "
previous cas = #{cas} new cas: #{new_cas}"
