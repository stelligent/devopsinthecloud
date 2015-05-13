class bundler {
  package { "bundler": 
    ensure => "installed", 
    provider => 'gem', 
    require => Package['rubygems'],
  }
}