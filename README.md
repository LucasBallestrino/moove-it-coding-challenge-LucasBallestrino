Moove It coding challenge
Lucas Ballestrino

##Requirements
The Ruby version used is 2.5.5p157 and the memcached server version 1.5.9
other versions may work, but are not guaranteed to do so.

##Installation
All testing was made on CentOS 8.
•Install memcached on CentOS
•```$ sudo yum -y install memcached```
•Then start the server
•```$ sudo systemctl enable --now memcached.service```

All Server values were default ones.

##Usage
Start the memcached server if not started yet : >$ memcached -p 11211
Then in Ruby, require the library and instantiate a client object

```
require_relative '../lib/RubyMemcachedClient'
cache = RubyMemcachedClient.new('127.0.0.1', 11211)
```

##Sample commands

```
set and get
cache.set("key","value")
cache.get("key") "key" #=> "value"
```

######get multiple values
```
cache.set("key","value")
cache.set("key2","value2")
cache.get("key key2") {"key"=>"value", "key2"=>"value2"}
```

##Server stats
```cache.stats``` should return the full list of Stats
If you want to get an specific server stat you should send a parameter as string
example: ```cache.stats("slabs")```

More commands examples can be found on the .rb files located in the [unit_test folder](unit_test)

##Test
All of the individual command tests are located in the [unit_test folder](unit_test), all were run on the default port and are in individual .rb files.
