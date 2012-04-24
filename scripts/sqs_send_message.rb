require 'rubygems'
require 'aws-sdk'
load '/usr/share/tomcat6/aws.config'

que_name=ARGV[0]
ip_address=ARGV[1]

sqs = AWS::SQS.new

queue = sqs.queues.named("#{que_name}")

queue.poll(:idle_timeout => 10) do |msg|
  puts "Got message: #{msg.body}"
  msg.delete
end

queue.send_message("#{ip_address}")
status = queue.receive_message(:limit => 1)
puts status.body