include_recipe "mysql::server"

service "mysql" do
  action :enable
end

include_recipe "database::mysql"

mysql_database "myface_dev" do
  connection(
    :host => "localhost",
    :username => "root",
    :password => node[:mysql][:server_root_password]
  )
  action :create
end

mysql_database_user "myface_app" do
  connection(
    :host => "localhost",
    :username => "root",
    :password => node[:mysql][:server_root_password]
  )
  password "supersecret"
  database_name "myface_dev"
  host "localhost"
  action [:create, :grant]
end
