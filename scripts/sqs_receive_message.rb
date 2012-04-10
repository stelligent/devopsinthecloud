require 'rubygems'
require 'aws-sdk'


que_name=ARGV[0]
access_key=ARGV[1]
secret_access_key=ARGV[2]

sqs = AWS::SQS.new(
  :access_key_id => "#{access_key}",
  :secret_access_key => "#{secret_access_key}")

queue = sqs.queues.named("#{que_name}")

status = queue.receive_message(:limit => 1)