require 'rubygems'
require 'aws-sdk-v1'
load File.expand_path('../../config/aws.config', __FILE__)

sdb = AWS::SimpleDB.new
  
AWS::SimpleDB.consistent_reads do
  domain = sdb.domains.create("test")
  item = domain.items['parameters']
  
  item.attributes.each_value do |name, value|
    puts "#{name}: #{value}"
    if name == 'params'
      puts value
    end
  end
end
