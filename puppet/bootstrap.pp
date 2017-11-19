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

host { 'master':
    ip => '10.100.100.10',
}

host { 'worker1':
    ip => '10.100.100.11',
}

host { 'worker2':
    ip => '10.100.100.12',
}