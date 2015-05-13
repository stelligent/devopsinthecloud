class httpd {
  package { 'httpd-devel':
    ensure => installed,
  }
  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => Package['httpd-devel'],
  }
}