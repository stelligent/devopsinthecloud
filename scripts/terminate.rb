require 'rubygems'
require 'aws-sdk'
load '/usr/share/tomcat6/aws.config'

instance=ARGV[0]

ec2 = AWS::EC2.new

instances = ec2.instances.ip_address("#{instance}")
puts instances.status