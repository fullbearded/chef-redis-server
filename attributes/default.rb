#
# Locations
#
default[:redis][:conf_dir]          = "/etc/redis"
default[:redis][:log_dir]           = "/var/log/redis"
default[:redis][:data_dir]          = "/var/lib/redis"

default[:redis][:home_dir]          = "/usr/local/share/redis"
default[:redis][:pid_file]          = "/var/run/redis.pid"

default[:redis][:db_basename]       = "dump.rdb"

# Server

default[:redis][:server][:addr]     = "0.0.0.0"
default[:redis][:server][:port]     = "6379"

# Install

default[:redis][:version]           = "2.8.12"
default[:redis][:release_url]       = "http://download.redis.io/releases/redis-:version:.tar.gz"

default[:redis][:server][:timeout]  = "300"

default[:redis][:saves]             = [["900", "1"], ["300", "10"], ["60", "10000"]]

default[:redis][:slave]             = "no"
if (node[:redis][:slave] == "yes")
  # TODO: replace with discovery
  default[:redis][:master_server]   = "redis-master." + domain
  default[:redis][:master_port]     = "6379"
end
