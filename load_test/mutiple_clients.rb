require_relative '../lib/RubyMemcachedClient'
i = 0
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
cache2 = RubyMemcachedClient.new('127.0.0.1', 11211)
cache3 = RubyMemcachedClient.new('127.0.0.1', 11211)
cache4 = RubyMemcachedClient.new('127.0.0.1', 11211)
puts "cache: #{cache.set("NewKey","Value")}"
puts "cache: #{cache.get("NewKey")}"
puts "cache2: #{cache2.get("NewKey")}"
puts "cache3: #{cache3.set("NewKey","other value")}"
puts "cache3: #{cache3.set("DifferentKey","Some text")}"
puts "cache4: #{cache4.get("NewKey DifferentKey")}"
