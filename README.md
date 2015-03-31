memcached
=========

This Puppet module provides classes for managing [Memcached](http://memcached.org/) and related packages.

Classes
-------

### `memcached`

By default, inclusion of this class installs `memcached` and enables its service:

```puppet
include memcached
```

Further customization may be done via class parameters, for example to purge the package, set the `ensure` parameter to `absent`:

```puppet
class { 'memcached':
  ensure => 'absent',
}
```

To prevent the `memcached` service from starting on boot, set the `service_enable` parameter to `false`:

```puppet
class { 'memcached':
  service_enable => false,
}
```

### `memcached::config`

By default, the `memcached` class does not modify the configuration file used by Linux platforms.  Customizations of this file are done with the `memcached::config` class.  For example to allow connections from beyond the localhost you'd set the `listen` parameter:

```puppet
class { 'memcached::config':
  listen => '0.0.0.0',
}
```

To change the maximum amount of memory used by memcached to one gigabyte (1024 megabytes), you'd set the `cachesize` parameter:

```puppet
class { 'memcached::maxsize':
  cachesize => 1024,
}
```

The full list of configuration parameters, which correspond to directly to the `memcached` command-line options, are:

* `port`
* `user`
* `cachesize`
* `maxconn`
* `listen`
* `logfile`
* `maxsize`

### `memcached::devel`

Installs the memcached development headers package for the platform.

### `memcached::iptables`

Sets up a firewall rule allowing external access to the Memcached instance -- use of this class requires the [puppetlabs-firewall](https://github.com/puppetlabs/puppetlabs-firewall) module and configuring the `listen` parameter in `memcached::config`.

### `memcached::lib`

Installs the [libMemcached](http://libmemcached.org/libMemcached.html) library package.

### `memcached::lib::devel`

Installs the libMemcached development headers package.

License
-------

Apache License, Version 2.0

Contact
-------

Justin Bronn <justin@counsyl.com>

Support
-------

Please log tickets and issues at https://github.com/counsyl/puppet-memcached
