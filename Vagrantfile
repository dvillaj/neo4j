$script_install_software = <<-SCRIPT
    wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -
    echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
    apt update
    apt install -y neo4j=1:3.5.14
    systemctl enable neo4j
    sed -i 's/#dbms.security.auth_enabled=false/dbms.security.auth_enabled=false/' /etc/neo4j/neo4j.conf
    sed -i 's/#dbms.connectors.default_listen_address=0.0.0.0/dbms.connectors.default_listen_address=0.0.0.0/' /etc/neo4j/neo4j.conf
    sed -i 's/#dbms.connector.bolt.listen_address=:7687/dbms.connector.bolt.listen_address=:7687/' /etc/neo4j/neo4j.conf
    sed -i 's/#dbms.connector.http.listen_address=:7474/dbms.connector.http.listen_address=:7474/' /etc/neo4j/neo4j.conf
    sed -i 's/dbms.connector.https.enabled=true/dbms.connector.https.enabled=false/' /etc/neo4j/neo4j.conf

    service neo4j restart
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-18.04"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vbguest.auto_update = false
  config.ssh.insert_key = false
  config.vm.box_check_update = false

  config.vm.define :neo4j do |neo4j|
    neo4j.vm.provider "virtualbox" do |vb|
      vb.name = "neo4j"
      vb.cpus = 1
      vb.memory = 1024
    end

    neo4j.vm.network :forwarded_port, guest: 7474, host: 7474
    neo4j.vm.network :forwarded_port, guest: 7687, host: 7687
  end


  config.vm.provision "shell", inline: $script_install_software, run: "always"

end
