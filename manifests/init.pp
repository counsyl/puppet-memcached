# == Class: memcached
#
# Installs the memcached package and enables the service.
#
# === Parameters
#
# [*ensure*]
#  The ensure value for the memcached package, defaults to 'installed'.
#
# [*package*]
#  The memcached package to install, defaults to 'memcached'.
#
# [*service*]
#  The memcached service to manage, defaults to 'memcached'.
#
# [*service_enable*]
#  The enable value for the memcached service, defaults to true.
#
# [*service_ensure*]
#  The ensure value for the memcached service, defaults to 'running'.
#
class memcached(
  $ensure         = 'installed',
  $package        = $memcached::params::package,
  $service        = $memcached::params::service,
  $service_enable = true,
  $service_ensure = 'running',
) inherits memcached::params {
  # Install memcached.
  package { $package:
    ensure => $ensure,
  }

  if $ensure != 'absent' {
    # Enable memcached service.
    service { $service:
      ensure  => $service_ensure,
      enable  => $service_enable,
      require => Package[$package],
    }
  }
}
