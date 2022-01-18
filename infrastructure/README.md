## Vagrant Kubernetes

This project installs an n-node Kubernetes cluster based on Kubernetes 1.20+ and containerd, with helm applications, and provisioned entirely by Ansible.

### Requirements:

* Virtualbox
* Vagrant
* Ansible (Linux only)

If being run under Ansible for Windows, it will detect this and install an Ansible controller on the primary node and bootstrap the cluster from there.  This relies on a known "crosstalk" SSH  key that is installed on each node for the vagrant user and inserted into authorized_keys.  If you want this removed post-installation you must do it yourself.

You must have some form of local DNS availability on your network tied to DHCP.  This was developed on a home network using `dnsmasq` which serves up DHCP DNS names to the ".local" domain.   Your home network may behave differently e.g. use a ".home" domain on your Broadband router etc.

Edit the various variables in `Vagrantfile` to reflect your requirements


### Features

* N-node Kubernetes cluster with untainted control plane permitting pod allocation
* Kubernetes 1.20+
* Containerd, not Docker!
* Nginx nodeport ingress on all nodes 80/443
* Kubernetes Dashboard
* nfs-subdir-external-provisioner to satisfy PersistentVolumeClaims
  * You will need to provide your own NFS server for this and use something reasonably open such as `/mnt/data/nfsroot *(rw,sync,no_root_squash,no_subtree_check)` in your `/etc/exports`.


### Automatic deployment

`vagrant up` is all that is required.  You may re-provision at any time using `vaqrant provision`

The cluster is robust enough to cope with `vagrant halt`

### Manual deployment or if you already have VMs to install this on

The Ansible playbooks are all fully portable and just require all hosts to be grouped into a single `[master]` and at least one `[workers]` with a few extra vars, as follows:
____
<pre>[all]
mynode1.domain
...
mynodeN.domain
[all:vars]
nodes=N
kubernetes_version=1.20-00
nfs_server=your.nfs.server.ip
nfs_path=/your/nfs/root
[master]
mynode1.domain
[workers]
mynode2.domain
...
mynodeN.domain</pre>

Assuming the above inventory is saved to `inventory.txt` you can bootstrap your own cluster using the following Ansibleincantations:

<pre>ansible-playbook -i inventory.txt /vagrant/ansible/kube-prereqs.yml
ansible-playbook -i inventory.txt /vagrant/ansible/kube-bootstrap.yml
ansible-playbook -i inventory.txt /vagrant/ansible/kube-apps.yml</pre>
