# Resourceが増えると、manifestの見通しが悪くなる
yumrepo { 'treasuredata':
  name     => 'treasuredata',
  descr    => 'treasuredata repo',
  baseurl  => 'http://packages.treasure-data.com/redhat/$basearch/',
  enabled  => 1,
  gpgcheck => 0,
}

package { 'td-agent':
  ensure  => installed,
  require => Yumrepo['treasuredata'],
}

file { '/etc/td-agent/td-agent.conf':
  content => template("td-agent.conf"),
  require => Package['td-agent'],
}

service { 'td-agent':
  enable     => true,
  ensure     => running,
  hasrestart => true,
  subscribe => File['/etc/td-agent/td-agent.conf'],
}
