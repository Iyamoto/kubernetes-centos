
package { 'kubernetes':
  ensure  => installed,
} ->
file { '/etc/kubernetes/config':
  ensure => 'file',
  source => '/vagrant/configs/config',
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
