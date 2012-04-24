require File.expand_path('../config/aws.config', __FILE__)
require 'rubygems'
require 'aws-sdk'

instance=ARGV[0]

ec2 = AWS::EC2.new

instances = ec2.instances.ip_address("#{instance}")
puts instances.status