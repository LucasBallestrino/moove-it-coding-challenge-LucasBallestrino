# Command gats test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# gats(keys,exptime) The keys should be spaced and sent as a String
# gats returns a hash with the memcached keys as the key and the value.
# Trying to gats only one key with value
cache.set("TheKey","some value")
puts cache.get("TheKey")
puts cache.gats("TheKey","1")
sleep 2
puts cache.get("TheKey")
# Trying to gats with more than one key
cache.set("TheKey","some value")
cache.set("secondkey","some value")
cache.set("thirdkey","some value")
puts cache.gats("TheKey secondkey thirdkey","1")
sleep 2
puts cache.get("TheKey secondkey thirdkey")
cache.flush
cache.set("NewKey","some text here","1")
the_key = cache.gets("NewKey") # Using gets to get cas value
value = the_key["NewKey"] # Getting the hash value
value =  value.split(" ")
cas = value[2] # Getting the cas_unique
puts ""
puts cache.gats("NewKey","0")
the_key = cache.gets("NewKey") # Using gets to get cas value
value = the_key["NewKey"] # Getting the hash value
value =  value.split(" ")
new_cas = value[2] # Getting the cas_unique
puts "
previous cas = #{cas} new cas: #{new_cas}"
