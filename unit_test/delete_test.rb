# Command delete test
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
# delete(key) This should delete the key and the value from the server.
cache.flush
# Trying to delete successfully
cache.set("TheKey", "A value")
puts cache.get("TheKey")
delete_result = cache.delete("TheKey")
puts "
delete result
#{delete_result}"
puts ""
puts cache.get("TheKey")
# Trying to delete a non existent key.
delete_result = cache.delete("NonExistentKey")
puts "
delete result
#{delete_result}

"
puts cache.get("NonExistentKey")
