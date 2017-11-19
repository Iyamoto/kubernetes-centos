
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
} ->
file { '/etc/kubernetes/apiserver':
  ensure => 'file',
  source => '/vagrant/configs/apiserver',
} ->
service { 'kube-apiserver':
  enable => true,
  ensure => 'running',
} ->
service { 'kube-controller-manager':
  enable => true,
  ensure => 'running',
} ->
service { 'kube-scheduler':
  enable => true,
  ensure => 'running',
}
