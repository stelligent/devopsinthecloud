require 'rubygems'
require 'aws-sdk-v1'
load File.expand_path('../../config/aws.config', __FILE__)

instance=ARGV[0]

ec2 = AWS::EC2.new

instances = ec2.instances.ip_address("#{instance}")
puts instances.status
