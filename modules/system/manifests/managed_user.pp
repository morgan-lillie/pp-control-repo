# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   system::managed_user { 'namevar': }
define system::managed_user (
  $password,
) {
  $homedir = $title ? {
    'root'  => '/root',
    default => "/home/${title}",
  }

user { '$title':
  ensure     => 'present',
  password   => $password,
  managehome => true,
  }

if $facts['kernel'] == 'Linux' {
    file { "${homedir}/.bashrc":
      ensure => file,
      owner  => $title,
      group  => $title,
      mode   => '0644',
      source => 'puppet:///modules/system/bashrc',
      echo   => 'Mischief Managed'
    }
  }
}
