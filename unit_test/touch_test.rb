# Command touch test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# The "touch" command is used to update the expiration time of an existing item without fetching it.
# touch(key,exptime)
cache.set("TheKey","some value")
puts cache.get("TheKey")
touch_result = cache.touch("TheKey","1")
puts "
touch result
#{touch_result}

"
puts cache.get("TheKey")
sleep 2
puts cache.get("TheKey")
# Getting the cas value in order to show that it doesn't change
cache.set("NewKey","some other value","1")
the_key = cache.gets("NewKey") # Using gets to get cas value
value = the_key["NewKey"] # Getting the hash value
value =  value.split(" ")
cas = value[2] # Getting the cas_unique
cache.touch("NewKey","0")
the_key = cache.gets("NewKey") # Using gets to get cas value
value = the_key["NewKey"] # Getting the hash value
value =  value.split(" ")
new_cas = value[2] # Getting the cas_unique
puts "
previous cas = #{cas} new cas = #{new_cas}
"
sleep 2
puts cache.get("NewKey")
# Trying to touch a non existent key
cache.flush
puts ""
puts cache.touch("NonExistentKey","1")
