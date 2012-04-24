require File.expand_path('../config/aws.config', __FILE__)
require 'rubygems'
require 'aws-sdk'

current_domain=ARGV[0]

sdb = AWS::SimpleDB.new

domain = sdb.domains[current_domain]
puts domain.exists?
domain.delete!
puts domain.exists?
