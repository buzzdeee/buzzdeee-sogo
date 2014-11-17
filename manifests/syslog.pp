class sogo::syslog (
  $sogo_service_ensure,
) {

  $sogo_syslog_ensure = $sogo_service_ensure ? {
    /running/ => 'present',
    default => 'absent',
  }

  newsyslog { '/var/log/sogo/sogod.log':
    ensure  => $sogo_syslog_ensure,
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
