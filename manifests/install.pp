class sogo::install (
  $package_name,
  $package_ensure,
) {

  package { $package_name:
    ensure => $package_ensure,
  }

  $webdirs = [ '/var/www/lib', '/var/www/lib/sogo', ]

  file { $webdirs:
    ensure => 'directory',
    owner  => 'root',
    group  => '0',
    mode   => '0755',
  }

  exec { 'copy sogo webresources':
    command => 'cp -R /usr/local/lib/GNUstep/SOGo/WebServerResources /var/www/lib/sogo/www',
    creates => '/var/www/lib/sogo/www',
  }

}
