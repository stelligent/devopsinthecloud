require 'rubygems'
require 'aws-sdk'


instance=ARGV[0]
access_key=ARGV[1]
secret_access_key=ARGV[2]

ec2 = AWS::EC2.new(
  :access_key_id => "#{access_key}",
  :secret_access_key => "#{secret_access_key}")

instances = ec2.instances.ip_address("#{instance}")
puts instances.status