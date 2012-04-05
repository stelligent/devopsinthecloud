# Class: Passenger
#
# Install Passenger.
#

class passenger {
  include make,
  
	package { "passenger":      ensure => "installed", provider => 'gem', }
}
