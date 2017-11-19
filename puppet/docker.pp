
package { 'docker':
  ensure  => installed,
} ->
service { 'docker':
  enable => true,
  ensure => 'running',
}

group { 'docker':
  ensure => 'present',
} ->
user { 'vagrant':
  groups => ['docker'],
  membership => minimum,
}
