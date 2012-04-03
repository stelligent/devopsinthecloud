require 'rubygems'
require 'aws-sdk'

ec2 = AWS::EC2.new(
     :access_key_id => '',
     :secret_access_key => '')

@instances = ec2.instances
@count = 0

@random_number= rand(0..4)
puts @random_number

@instances.each do |instance|
  @count = @count + 1
  if @count == @random_number
    puts instance.id
    instance.terminate
  end
end