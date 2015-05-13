# Class: passenger::params

class passenger::params {  
  $version='3.0.12'

  $gem_path = '/usr/lib/ruby/gems/1.8/gems'
  $gem_binary_path = '/usr/lib/ruby/gems/1.8/gems/bin'
  $mod_passenger_location = "/usr/lib/ruby/gems/1.8/gems/passenger-$version/ext/apache2/mod_passenger.so"
}