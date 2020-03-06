Vagrant.configure("2") do |config|
    config.vm.box = "dvillaj/neo4j"
    config.vm.box_version = "1"
    
    config.vm.network :forwarded_port, guest: 7474, host: 7474
    config.vm.network :forwarded_port, guest: 7687, host: 7687
  end
  