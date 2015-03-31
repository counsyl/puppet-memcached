# == Class: memcached::devel
#
# Install memcached development headers and libraries.
#
# === Parameters
#
# [*ensure*]
#  Ensure value for the memcached development headers package resource,
#  default is 'installed'.
#
# [*package*]
#  Name of the memcached development headers package to install,
#  default is platform-dependent.
#
# [*provider*]
#  The provider for the memcached development headers package resource,
#  default is platform-dependent (but usually undefined).
#
class memcached::devel(
  $ensure   = 'installed',
  $package  = $memcached::params::devel,
  $provider = $memcached::params::provider,
) inherits memcached::params {
  if $package {
    package { $package:
      ensure   => $ensure,
      provider => $provider,
    }
  }
}
