class sogo::syslog (
) {

  newsyslog { '/var/log/sogo/sogod.log':
    owner   => '_sogo',
    group   => '_sogo',
    mode    => '640',
    keep    => '7',
    size    => '1024',
    when    => '*',
    flags   => 'Z',
    command => '/etc/rc.d/sogod restart',
  }
}
