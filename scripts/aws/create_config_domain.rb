require 'rubygems'
require 'aws-sdk-v1'
load File.expand_path('../../config/aws.config', __FILE__)


file = File.open("/tmp/properties", "r")

sdb = AWS::SimpleDB.new
  
AWS::SimpleDB.consistent_reads do
  domain = sdb.domains.create("test")
  item = domain.items['parameters']
  
  file.each_line do|line|
    key,value = line.split '='
    item.attributes.set(
      "#{key}" => "#{value}")
  end
  
  item.attributes.each_value do |name, value|
    puts "#{name}: #{value}"
    if name == 'params'
      puts value
    end
  end
end
