#!/bin/sh
#

BASENAME=$1
DOMAINNAME=$2
NODES=$3
KUBERNETES_VERSION=$4
NFS_SERVER=$5
NFS_PATH=$6

echo "Starting windows-bootstrap.sh on ${USER}@$(hostname -f)"

echo "Installing Ansible controller packages. May take some time. Check /tmp/install.*.log"
echo "Installing python..."
sudo apt-get -y install python3 python3-pip >/tmp/install.apt.stdout.log 2>/tmp/install.apt.stderr.log || exit 1
echo "Installing ansible..."
sudo pip3 install ansible >/tmp/install.pip.stdout.log 2>/tmp/install.pip.stderr.log || exit 1

echo "Preparing Ansible inventory"
echo "[hosts]" > $HOME/inventory.txt
for x in $(seq 1 $NODES); do
  echo "${BASENAME}${x}.${DOMAINNAME}" >> $HOME/inventory.txt
done
cat >> $HOME/inventory.txt <<EOF
[hosts:vars]
nodes=$NODES
kubernetes_version=$KUBERNETES_VERSION
nfs_server=$NFS_SERVER
nfs_path=$NFS_PATH
[master]
${BASENAME}1.${DOMAINNAME}
[workers]
EOF
for x in $(seq 2 $NODES); do
  echo "${BASENAME}${x}.${DOMAINNAME}" >> $HOME/inventory.txt
done

echo "Checking Ansible connectivity..."
ansible -i $HOME/inventory.txt all -m ping || exit 1

echo "Running playbooks..."
ansible-playbook -i $HOME/inventory.txt /vagrant/ansible/growpart.yml
ansible-playbook -i $HOME/inventory.txt /vagrant/ansible/kube-prereqs.yml
ansible-playbook -i $HOME/inventory.txt /vagrant/ansible/kube-bootstrap.yml
ansible-playbook -i $HOME/inventory.txt /vagrant/ansible/kube-apps.yml

echo "Done"
exit 0
