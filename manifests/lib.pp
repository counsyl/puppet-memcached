# == Class: memcached::lib
#
# Installs the libmemcached library:
#
#   http://libmemcached.org/libMemcached.html
#
# === Parameters
#
# [*ensure*]
#  The ensure value for the package, defaults to 'installed'.
#
# [*package*]
#  The package for the libmemached library, the default is platform-dependent.
#
class memcached::lib(
  $ensure  = 'installed',
  $package = $memcached::params::lib,
) inherits memcached::params {
  package { $package:
    ensure => $ensure,
  }
}
