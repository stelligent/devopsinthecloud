require 'rubygems'
require 'aws-sdk-v1'
load File.expand_path('../../config/aws.config', __FILE__)

current_domain=ARGV[0]

sdb = AWS::SimpleDB.new

domain = sdb.domains[current_domain]
puts domain.exists?
domain.delete!
puts domain.exists?
