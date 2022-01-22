unless Vagrant.has_plugin?("vagrant-disksize")
  raise  Vagrant::Errors::VagrantError.new, "vagrant-disksize plugin is missing. Please install it using 'vagrant plugin install vagrant-disksize', force-clean, and then restart"
end

nodes = "${count}"
basename = "${basename}"
domainname = "${domain}"
nfs_server = "${nfs_server}"
nfs_path = "${nfs_path}"
bridge_interface = "${interface}"

use_dhcp = ${dhcp}
network = "${network}"
node1_address = ${start_at}

kubernetes_version =  "${kubernetes_version}"

nodes = nodes.to_i

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-20.04"
  config.disksize.size = "${disksize}GB"

  config.vm.provider :virtualbox do |v|
    v.memory = ${memory}
    v.cpus = ${cpu}
    v.linked_clone = true
    v.customize ["modifyvm", :id, "--nested-hw-virt", "on"]
    v.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
  end

  (1..nodes).each do |n|
    config.vm.define "#{basename}#{n}.#{domainname}" do |config|

      if (use_dhcp == true)
        config.vm.network "public_network", bridge: "#{bridge_interface}"
      else
        last_octet = node1_address + n -1
        config.vm.network "public_network", bridge: "#{bridge_interface}" , ip: "#{network}.#{last_octet}"
      end

      config.vm.provider :virtualbox do |v|
        v.name = "#{basename}#{n}.#{domainname}"
      end

      config.vm.hostname = "#{basename}#{n}.#{domainname}"

      if n == nodes
        # Grow vagrant partition and filesystem
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/growpart.yml"
          ansible.limit = "all"
          ansible.become = true
        end

        # Install Kubernetes prerequisites
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/kube-prereqs.yml"
          ansible.limit = "all"
          ansible.become = true
          ansible.extra_vars = {
            kubernetes_version: "#{kubernetes_version}"
          }
        end

        # Install Kubernetes
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/kube-bootstrap.yml"
          ansible.groups = {
            "master" => ["#{basename}1.#{domainname}"],
            "workers" => ["#{basename}[2:#{nodes}].#{domainname}"],
          }
          ansible.extra_vars = {
            kubernetes_version: "#{kubernetes_version}",
            nodes: "#{nodes}"
          }
          ansible.limit = "all"
          ansible.become = true
        end

        # Deploy base apps
        config.vm.provision "ansible" do |ansible|
          ansible.playbook = "ansible/kube-apps.yml"
          ansible.groups = {
            "master" => ["#{basename}1.#{domainname}"],
            "workers" => ["#{basename}[2:#{nodes}].#{domainname}"],
          }
          ansible.extra_vars = {
            nodes: "#{nodes}",
            nfs_server: "#{nfs_server}",
            nfs_path: "#{nfs_path}",
            domain: "#{domainname}"
          }
          ansible.limit = "all"
          ansible.become = true
         end
      end #nodes
    end #config
  end # 1..nodes
end #config
