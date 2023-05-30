# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # https://www.edureka.co/blog/10-steps-to-create-multiple-vms-using-vagrant/
  (1..3).each do |i|

    config.vm.define "ha#{i}" do |node|
        # https://groups.google.com/g/vagrant-up/c/EUON-Jh2ASA
        node.vm.hostname = "ha#{i}"

        # https://superuser.com/a/984310
        #node.vm.network "public_network", bridge: "enp5s0f1", adapter: "1"
        node.vm.network "public_network", bridge: "enp5s0f1"

        node.vm.provider "virtualbox" do |vb|
            vb.memory = "2048"
            vb.name = "ha#{i}"  
        end
    end
  end


  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y vim ca-certificates curl gnupg
    
    # https://docs.docker.com/engine/install/debian/
    #for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
    install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
        pip
    
    # for ansible scripts
    pip install docker
  SHELL
end
