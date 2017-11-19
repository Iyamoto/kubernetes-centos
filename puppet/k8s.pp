
package { 'etcd':
  ensure  => installed,
} ->
service { 'etcd':
  enable => true,
  ensure => 'running',
}

package { 'kubernetes':
  ensure  => installed,
}
