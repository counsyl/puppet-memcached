# == Class: memcached::python
#
# Installs the python-memcached library.
#
# === Parameters
#
# [*ensure*]
#  Ensure value for the python-memcached package resource, default is
#  'installed'.
#
# [*package*]
#  Name of the python-memcached package to install, default depends on the
#  platform.  Will default to 'python-memcached' if 'pip' is used as
#  the provider.
#
# [*provider*]
#  The provider for the python-memcached package resource, default is
#  platform-dependent.
#
class memcached::python(
  $ensure   = 'installed',
  $package  = $memcached::params::python,
  $provider = $memcached::params::provider,
) inherits memcached::params {

  if ! $package or $provider == 'pip' {
    # Use pip to install if requested or not in package repo.
    $python_package = 'python-memcached'
  } else {
    $python_package = $package
  }

  package { $python_package:
    ensure   => $ensure,
    provider => $provider,
    require  => Class['::python'],
  }
}
