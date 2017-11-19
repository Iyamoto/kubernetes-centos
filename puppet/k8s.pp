
package { 'etcd':
  ensure  => installed,
} ->
file { '/etc/etcd/etcd.conf':
  ensure => 'file',
  source => '/vagrant/configs/etcd.conf',
} ->
service { 'etcd':
  enable => true,
  ensure => 'running',
}

package { 'kubernetes':
  ensure  => installed,
} ->
file { '/etc/kubernetes/config':
  ensure => 'file',
  source => '/vagrant/configs/config',
}
