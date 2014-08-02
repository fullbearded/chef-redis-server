include_recipe "install_from"
# include_recipe "users::sysadmins"

install_from_release('redis') do
  release_url  node[:redis][:release_url]
  home_dir     node[:redis][:home_dir]
  version      node[:redis][:version]
  action       [ :install, :install_with_make ]
  not_if{ File.exists?(File.join(node[:redis][:home_dir], 'src', 'redis-server')) }
end

directory '/etc/redis' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

template '/etc/redis/redis.conf' do
  source 'redis.conf.erb'
  mode 0755
  owner "root"
  group "root"
end

template '/etc/init.d/redis-server' do
  source 'redis-server.erb'
  mode 0755
  owner "root"
  group "root"
end

service "redis-server" do
  supports start: true, stop: true
  action [ :start ]
end
