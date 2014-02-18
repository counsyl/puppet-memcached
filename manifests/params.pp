# == Class: memcached::params
#
# Platform-dependent parameters for memcached.
#
class memcached::params {
  case $::osfamily {
    debian: {
      $devel    = 'libmemcached-dev'
      $library  = 'libmemcache0'
      $package  = 'memcached'
      $python   = 'python-memcache'
      $service  = 'memcached'
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
      $logfile  = '/var/log/memcached.log'
      $config   = '/etc/memcached.conf'
      $template = 'memcached/memcached.debian.erb'
    }
    redhat: {
      $devel    = 'libmemcached-devel'
      $library  = 'libmemcached'
      $package  = 'memcached'
      $python   = 'python-memcached'
      $service  = 'memcached'
      $user     = 'memcached'
      $config   = '/etc/sysconfig/memcached'
      $template = 'memcached/memcached.redhat.erb'
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
