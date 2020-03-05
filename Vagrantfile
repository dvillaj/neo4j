Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-18.04"
  config.ssh.insert_key = false
  config.vm.box_check_update = false

  config.vm.define :neo4j do |neo4j|
    neo4j.vm.provider "virtualbox" do |vb|
      vb.name = "neo4j-host"
      vb.cpus = 1
      vb.memory = 1024
    end

    neo4j.vm.network :forwarded_port, guest: 7474, host: 7474
    neo4j.vm.network :forwarded_port, guest: 7687, host: 7687
  end

end
