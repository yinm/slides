# requireを指定することで、 yumrepo, packageの順で実行することを明示している
yumrepo { 'treasuredata':
  name     => 'treasuredata',
  descr    => 'treasuredata repo',
  baseurl  => 'http://packages.treasure-data.com/redhat/$basearch/',
  enabled  => 1,
  gpgcheck => 0,
}

package { 'td-agent':
  ensure  => installed,
  require => Yumrepo['treasuredata'], # 依存関係を指定
}