# == Class: memcached
#
# Installs the memcached package and enables the service.
#
class memcached(
  $ensure         = 'installed',
  $service_ensure = 'running',
  $package        = $memcached::params::package,
  $provider       = $memcached::params::provider,
  $service        = $memcached::params::service,
) inherits memcached::params {
  # Install memcached.
  package { $package:
    ensure   => $ensure,
    alias    => 'memcached',
    provider => $provider,
  }

  # Enable memcached service.
  service { $service:
    ensure     => $service_ensure,
    alias      => 'memcached',
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package],
  }
}
