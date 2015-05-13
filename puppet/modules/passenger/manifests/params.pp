# Class: passenger::params

class passenger::params {  
  $version='5.0.7'

  $gem_path = '/usr/lib64/ruby/gems/2.0/gems/'
  $gem_binary_path = '/usr/lib64/ruby/gems/2.0/gems/bin'
  $mod_passenger_location = "//usr/local/share/ruby/gems/2.0/gems/passenger-$version/buildout/apache2/mod_passenger.so"
}
