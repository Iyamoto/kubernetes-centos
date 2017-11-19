#!/bin/bash

set -e

echo "Starting bootstrap script"

sudo yum install -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
sudo yum install -y puppet-agent

sudo puppet apply /vagrant/puppet/bootstrap.pp
sudo puppet apply /vagrant/puppet/docker.pp
# sudo puppet apply /vagrant/puppet/k8s.pp

# source etcd.sh
# docker pull gcr.io/google-containers/etcd:2.2.1
# source kubebins.sh
