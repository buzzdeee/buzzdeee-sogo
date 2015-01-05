# == Class: sogo
#
# Full description of class sogo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'sogo':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class sogo (
  $sogo_defaults_defaultvalues = $sogo::params::sogo_defaults_defaultvalues,
  $sogo_defaults = $sogo::params::sogo_defaults,
  $package_name = $sogo::params::package_name,
  $package_ensure = $sogo::params::package_ensure,
  $service_name = $sogo::params::service_name,
  $service_ensure = $sogo::params::service_ensure,
  $service_enable = $sogo::params::service_enable,
  $service_flags = $sogo::params::service_flags,
) inherits sogo::params {

  class { 'sogo::install':
    package_name   => $package_name,
    package_ensure => $package_ensure,
  }

  class { 'sogo::config':
    sogo_defaults_defaultvalues => $sogo_defaults_defaultvalues,
    sogo_defaults               => $sogo_defaults,
  }

  class { 'sogo::syslog':
    sogo_service_ensure => $service_ensure,
  }

  class { 'sogo::service':
    service_name   => $service_name,
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    service_flags  => $service_flags,
  }

  Class['sogo::install'] ->
  Class['sogo::syslog'] ->
  Class['sogo::config'] ~>
  Class['sogo::service']
}
