# Class: Passenger
#
# Install Passenger.
#

class passenger {
	
	$resource_url = $passenger::params::resource_url
	
	package { "ruby-1.9.3":
	       provider => rpm,
	       ensure => installed,
	       source => "${resource_url}/ruby-1.9.3p0-2.amzn1.x86_64.rpm"
	}
	package { 'passenger':
	    ensure   => 'installed',
	    provider => 'gem',
	}
	package { 'bundler':
	    ensure   => 'installed',
	    provider => 'gem',
	}
	package { "libcurl-devel":  ensure => "installed" }
	package { "mysql-devel":    ensure => "installed" }
	package { "openssl-devel":  ensure => "installed" }
	package { "gcc":            ensure => "installed" }
	package { "make":           ensure => "installed" }
	package { "gcc-c++":        ensure => "installed" }
	package { "zlib-devel":     ensure => "installed" }
	package { "curl-devel":     ensure => "installed" }
	package { "libxslt-devel":  ensure => "installed" }
	package { "sqlite-devel":   ensure => "installed" }
}
