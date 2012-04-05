class bundler {
  package { "bundler": 
    ensure => "installed", 
    provider => 'gem', 
  }
}