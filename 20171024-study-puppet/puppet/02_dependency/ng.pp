# どちらが先に適用されるかわからない
yumrepo { 'treasuredata':
  name     => 'treasuredata',
  descr    => 'treasuredata repo',
  baseurl  => 'http://packages.treasure-data.com/redhat/$basearch/',
  enabled  => 1,
  gpgcheck => 0,
}

package { 'td-agent':
  ensure  => installed,
}