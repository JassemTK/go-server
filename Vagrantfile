node_list = [
    { :host => "master-node", :cpu => 4 ,:ram => 4120,:ip => "10.0.0.5" },
    { :host => "slave-node", :cpu => 1 ,:ram => 1024,:ip => "03.0.0.51" },
]

varDomain = "homelab"

Vagrant.configure("2") do |config|

    config.vm.synced_folder 'C:/workplace/vagrant/', '/vagrant', type: "virtualbox", disabled: true
    config.vm.provision "bootstrap", type: "shell" do |s|
		s.inline = "sudo yum update -y"
		s.inline = "sudo yum install git golang podman buildah skopeo -y"
		end
    node_list.each do |node|
        config.vm.define node[:host] do |node_config|
            node_config.vm.box = "centos/stream8"
            node_config.vm.hostname = "#{node[:host]}.#{varDomain}"
            node_config.vm.provider :virtualbox do |v|
			node_config.vm.network "private_network", ip: node[:ip].to_s
                #v.name = node[:host].to_s
                v.customize ["modifyvm", :id, "--memory", node[:ram].to_s]
                v.customize ["modifyvm", :id, "--cpus", node[:cpu].to_s]
            end
        end
    end
end
