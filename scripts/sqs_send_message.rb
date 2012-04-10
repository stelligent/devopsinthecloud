require 'rubygems'
require 'aws-sdk'


que_name=ARGV[0]
access_key=ARGV[1]
secret_access_key=ARGV[2]
ip_address=ARGV[3]

sqs = AWS::SQS.new(
  :access_key_id => "#{access_key}",
  :secret_access_key => "#{secret_access_key}")


queue = sqs.queues.named("#{que_name}")

queue.poll(:idle_timeout => 10) do |msg|
  puts "Got message: #{msg.body}"
  msg.delete
end

queue.send_message("#{ip_address}")
status = queue.receive_message(:limit => 1)
puts status.body