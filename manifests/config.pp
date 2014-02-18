# == Class: memcached::config
#
# This class creates the memcached configuration file according to the given
# parameters.
#
# === Parameters
#
# [*config_file*]
#  The path of the configuration file, default is platform dependent.
#
# [*port*]
#  The port on which the memcached daemon will listen.  Defaults to 11211.
#
# [*cachesize*]
#  The total cache size for memcached to use, in megabytes.
#  Defaults to 64.
#
# [*maxconn*]
#  The maximum number of simultaneous connections. Defaults to 1024.
#
# [*listen*]
#  The IP address of memcached to listen on.
#
# [*logfile*]
#  The path to the log file, default is '/var/log/memcached.log' on
#  debian-based systems only.
#
# [*maxsize*]
#  The maximum size of items to store in memcached, in bytes.  Also
#  accepts suffixes of 'K' and 'M' to indicate size is in kilobytes
#  and megabytes, respectively.  Defaults to 1M -- changing this
#  default may affect performance.
#
# [*template*]
#  Advanced usage only.  The template to use to generate the configuration
#  file, the default is platform-dependent.
#
class memcached::config(
  $config_file = $memcached::params::config,
  $port        = $memcached::params::port,
  $user        = $memcached::params::user,
  $cachesize   = $memcached::params::cachesize,
  $maxconn     = $memcached::params::maxconn,
  $listen      = $memcached::params::listen,
  $logfile     = $memcached::params::logfile,
  $maxsize     = $memcached::params::maxsize,
  $template    = $memcached::params::template,
) inherits memcached::params {
  include memcached
  include sys

  # Other platforms have their own configuration file, which is
  # created from a template.
  file { $config_file:
    owner   => 'root',
    group   => $sys::root_group,
    mode    => '0644',
    content => template($template),
    notify  => Service['memcached'],
    require => Package['memcached'],
  }
}
