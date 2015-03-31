# == Class: memcached::iptables
#
# Sets up Linux firewall rules for hosting a memcached instance.
#
# === Parameters
#
# [*port*]
#  The TCP port for memcached traffic, defaults to 11211.
#
# [*priority*]
#  The priority for the memcached firewall rules, defaults to 100.
#
# [*iniface*]
#  Interface to apply iptables to, default is undefined.
#
class memcached::iptables(
  $port     = '11211',
  $priority = '100',
  $iniface  = undef,
){
  include sys::iptables

  firewall { "${priority} allow memcached tcp":
    action  => 'accept',
    proto   => 'tcp',
    dport   => $port,
    iniface => $iniface,
  }
}
