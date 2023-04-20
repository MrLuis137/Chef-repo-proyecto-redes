#
# Cookbook:: nginx-wraper
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.
package 'nginx' do
    action :install
  end
  
  service 'nginx' do
    action [:enable, :start]
  end
  
  template "nginx.conf" do
    path "/etc/nginx/nginx.conf"
    source "nginx.conf.erb"
    action :create
    notifies :reload, 'service[nginx]', :immediately
  end