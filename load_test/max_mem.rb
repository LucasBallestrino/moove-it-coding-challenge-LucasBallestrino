require_relative '../lib/RubyMemcachedClient'
# This should make the default memory (64MB) full and the server should delete the older values
i = 0
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
while i < 800000
  puts "set value #{i}"
  puts cache.set("TheKey#{i}","Value #{i} FDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFSFDFDSDGFS")
  i +=1
end
puts cache.get("TheKey1")
