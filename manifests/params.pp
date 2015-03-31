# == Class: memcached::params
#
# Platform-dependent parameters for memcached.
#
class memcached::params {
  case $::osfamily {
    'Debian': {
      case $::lsbdistcodename {
        'lucid', 'squeeze': {
          # On older versions, memcached ran as 'nobody', see:
          #  https://bugs.launchpad.net/ubuntu/+source/memcached/+bug/599461
          $user = 'nobody'
        }
        default: {
          $user = 'memcache'
        }
      }

      # The libmemcached library's package name depends on the distribution.
      case $::lsbdistcodename {
        'squeeze': {
          $lib = 'libmemcached5'
        }
        'precise': {
          $lib = 'libmemcached6'
        }
        'trusty', 'wheezy': {
          $lib = 'libmemcached10'
        }
        'jessie', 'utopic', 'vivid': {
          $lib = 'libmemcached11'
        }
        default: {
          fail("Do not know the libmemcached package on ${::lsbdistcodename}")
        }
      }

      $devel     = 'libmemcached-dev'
      $package   = 'memcached'
      $python    = 'python-memcache'
      $service   = 'memcached'
      $lib_devel = 'libmemcached-dev'
      $logfile   = '/var/log/memcached.log'
      $config    = '/etc/memcached.conf'
      $template  = 'memcached/memcached.debian.erb'
    }
    'RedHat': {
      $devel     = 'memcached-devel'
      $lib       = 'libmemcached'
      $lib_devel = 'libmemcached-devel'
      $package   = 'memcached'
      $python    = 'python-memcached'
      $service   = 'memcached'
      $user      = 'memcached'
      $config    = '/etc/sysconfig/memcached'
      $template  = 'memcached/memcached.redhat.erb'
    }
    default: {
      fail("Do not know how to install memcached on ${::osfamily}.\n")
    }
  }

  # Default values used by memcached.
  $port      = '11211'
  $cachesize = '64'
  $maxconn   = '1024'
  $listen    = '127.0.0.1'
  $maxsize   = '1M'
}
