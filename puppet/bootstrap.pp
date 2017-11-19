notify { 'greeting':
  message => 'Starting Puppet'
}

package { 'git':
  ensure  => installed,
}

package { 'bash-completion':
  ensure  => installed,
}

package { 'nano':
  ensure  => installed,
}

service { 'ntpd':
  enable => true,
  ensure => 'running',
}
