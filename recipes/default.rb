#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
if node["platform"] == "ubuntu"
execute "apt-get update" do
    command "apt-get update"
end
end

package_name = "httpd"

if node["platform"] == "ubuntu"
package_name = "apache2"
end

package package_name do
   action :install
end

service package_name do
  action [:enable, :start]
end

template "/var/www/html/index.html" do
  source "index.html.erb"
  mode "0644"
end
