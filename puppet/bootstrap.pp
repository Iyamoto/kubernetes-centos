notify { 'greeting':
  message => 'Starting Puppet'
}

package { 'git':
  ensure  => installed,
}

package { 'bash-completion':
  ensure  => installed,
}

package { 'jq':
  ensure  => installed,
}

package { 'nano':
  ensure  => installed,
}

package { 'ntp':
  ensure  => installed,
}  ->
service { 'ntp':
  enable => true,
  ensure => 'running',
}
