require 'rubygems'
require 'aws-sdk'
load File.expand_path('../../config/aws.config', __FILE__)

que_name=ARGV[0]

sqs = AWS::SQS.new

queue = sqs.queues.named("#{que_name}")

status = queue.receive_message(:limit => 1)
puts status.body