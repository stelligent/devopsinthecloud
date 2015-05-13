class system {
  package { "rubygems":         ensure => "installed" }
  package { "make":             ensure => "installed" }
  package { "gcc":              ensure => "installed" }
  package { "gcc-c++":          ensure => "installed" }
  package { "ruby-devel":       ensure => "installed" }
  package { "libcurl-devel":    ensure => "installed" }
  package { "zlib-devel":       ensure => "installed" }
  package { "openssl-devel":    ensure => "installed" }
  package { "libxml2-devel":    ensure => "installed" }
  package { "libxslt-devel":    ensure => "installed" }
}