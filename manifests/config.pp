class sogo::config (
  $sogo_defaults_defaultvalues,
  $sogo_defaults,
) {
  $commons = hiera_hash("$sogo_defaults_defaultvalues")
  $defaults = hiera_hash("$sogo_defaults")

notice("Configuring \$defaults ${defaults}")

notice("Configuring \$commons ${commons}")

  create_resources(gsdefaults, $defaults, $commons)
}
