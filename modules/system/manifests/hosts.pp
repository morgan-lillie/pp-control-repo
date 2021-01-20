# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include system::hosts
class system::hosts {
  host { 'localhost':
  ensure       => 'present',
  host_aliases => ['localhost.localdomain', 'localhost4', 'localhost4.localdomain4'],
  ip           => '127.0.0.1',
  provider     => 'parsed',
  target       => '/etc/hosts',
  }

  resources { 'host':
  purge => true,
  }
}
