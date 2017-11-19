#!/bin/bash

set -e

echo "Starting bootstrap script"

# Add /opt/puppetlabs to the sudo secure_path
sudo sed -i -e 's#\(secure_path = .*\)$#\1:/opt/puppetlabs/bin#' /etc/sudoers

sudo yum install -y http://yum.puppetlabs.com/puppet/puppet-release-el-7.noarch.rpm
sudo yum install -y puppet-agent

sudo puppet apply /vagrant/puppet/bootstrap.pp
sudo puppet apply /vagrant/puppet/docker.pp
# sudo puppet apply /vagrant/puppet/k8s.pp

# source etcd.sh
# docker pull gcr.io/google-containers/etcd:2.2.1
# source kubebins.sh
