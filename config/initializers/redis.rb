# You need to specify the REDIS_URI entry in you environmnet variable.
# The redis uri looks like this:
#   redis://username:password@my.host:6789
# If you are using "redis to go", it should be situated at the top of the config page
#
# Google the "environment variable" for information in different platforms, should be straight forward
uri = URI.parse(ENV['REDIS_URI'])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)