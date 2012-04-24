require 'rubygems'
require 'aws-sdk'
load '/usr/share/tomcat6/aws.config'

que_name=ARGV[0]

sqs = AWS::SQS.new

queue = sqs.queues.named("#{que_name}")

status = queue.receive_message(:limit => 1)
puts status.body