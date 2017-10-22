# classごとに関連するテンプレートなどのファイルもひとかたまりにすることで、再利用性を高める
class td-agent {
  include td-agent::install
  include td-agent::config
  include td-agent::service

     Class['td-agent::install']
  -> Class['td-agent::config']
  ~> Class['td-agent::service']
}