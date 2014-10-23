class sogo::params {
  $sogo_defaults_defaultvalues = 'sogo::config::config_defaults'
  $sogo_defaults = 'sogo::config::defaults'
  $package_name = 'sogo'
  $package_ensure = 'installed'
  $service_name = 'sogod'
  $service_ensure = 'running'
  $service_enable = true
  $service_flags = undef
}
