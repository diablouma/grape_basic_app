VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder "salt/roots/", "/srv/salt/"

  config.vm.network :forwarded_port, guest: 9292, host: 9292

  config.vm.provision :salt do |salt|
    salt.log_level = "all"
    salt.bootstrap_options = "-P"
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end
end
