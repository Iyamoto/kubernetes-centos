
# package { 'etcd':
#   ensure  => installed,
# } ->
# file { '/etc/etcd/etcd.conf':
#   ensure => 'file',
#   source => '/vagrant/configs/etcd.conf',
# } ->
# service { 'etcd':
#   enable => true,
#   ensure => 'running',
# }

package { 'kubernetes':
  ensure  => installed,
} ->
file { '/etc/kubernetes/kubelet':
  ensure => 'file',
  content => template('/vagrant/configs/kubelet'),
}->
service { 'kube-proxy':
  enable => true,
  ensure => 'running',
} ->
service { 'kubelet':
  enable => true,
  ensure => 'running',
}
