# Class: passenger
# This class installs passenger

class passenger::install {
  include passenger::params
  require system
  $version=$passenger::params::version

  package {'passenger':
    name   => 'passenger',
    ensure => "installed",
    provider => 'gem',
  }

  exec {'compile-passenger':
    path => [ $passenger::params::gem_binary_path, '/usr/bin', '/bin'],
    command => 'passenger-install-apache2-module -a',
    logoutput => true,
    creates => $passenger::params::mod_passenger_location,
    require => Package['passenger'],
  }
}
