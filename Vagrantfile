Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :sensu do |sensu_config|
       sensu_config.vm.box = "Centos6"
       sensu_config.vm.network  :hostonly, "10.1.2.42"
       sensu_config.ssh.max_tries = 100
       sensu_config.vm.host_name = "sensu"
       sensu_config.vm.provision :puppet do |sensu_puppet|
       		sensu_puppet.pp_path = "/tmp/vagrant-puppet"
       		sensu_puppet.manifests_path = "manifests"
       		sensu_puppet.module_path = "modules"
       		sensu_puppet.manifest_file = "site.pp"
       end
  end
end
