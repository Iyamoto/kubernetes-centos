#!/bin/bash

set -e

echo "Starting bootstrap script"

# Add /opt/puppetlabs to the sudo secure_path
sudo sed -i -e 's#\(secure_path = .*\)$#\1:/opt/puppetlabs/bin#' /etc/sudoers

sudo yum install -y http://yum.puppetlabs.com/puppet/puppet-release-el-7.noarch.rpm
sudo yum install -y puppet-agent

sudo puppet apply /vagrant/puppet/bootstrap.pp
sudo puppet apply /vagrant/puppet/docker.pp

if [ "$HOSTNAME" = master ]; then
    printf "Configuring master node"
    sudo puppet apply /vagrant/puppet/k8s.pp
    sudo puppet apply /vagrant/puppet/k8s-worker.pp
else
    printf "Configuring workers"
    sudo puppet apply /vagrant/puppet/k8s-worker.pp
fi
