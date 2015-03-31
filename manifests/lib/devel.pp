# == Class: memcached::lib::devel
#
# Installs the libmemcached library development headers.
#
# === Parameters
#
# [*ensure*]
#  The ensure value for the package, defaults to 'installed'.
#
# [*package*]
#  The package for the libmemached development library, the default is
#  platform-dependent.
#
class memcached::lib::devel(
  $ensure  = 'installed',
  $package = $memcached::params::lib_devel,
) inherits memcached::params {
  if $package {
    package { $package:
      ensure => $ensure
    }
  }
}
