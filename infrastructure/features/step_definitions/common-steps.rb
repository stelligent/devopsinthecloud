$:.unshift(File.dirname(__FILE__) + '/../support')
require "rubygems"
require 'runcommand'


#-------------------------
# Local or remote testing
#-------------------------
# Run tests locally
Given /^I am testing the local environment$/ do
    @run_command = RunCommand.new
end

# Run tests remotely using ssh
Given /^I am sshed into the environment$/ do
    # Sanity check
    missing_envs = [ 'env_ip', 'env_user' ].select {|e| ENV[e].nil?}
    raise "ERROR: missing variables: [ #{missing_envs.join(', ')} ]" unless missing_envs.empty?
    @run_command = RunCommand.new(:host => ENV["env_ip"],
                                  :user => ENV["env_user"])
end

#-------------------------
# Running external commands
#-------------------------
# Run a command
When /^I run "([^"]*)"$/ do |cmd|
    @output = @run_command.run(cmd)
end

# Scrape a file
When /^I scrape "([^"]*)"$/ do |file_to_scrape| 
  @file_to_scrape = file_to_scrape
end

# Partial match on command output
Then /^I should see "([^"]*)"$/ do |value|
    @output.should include value
end

#-------------------------
# Property files
#-------------------------
# Check properties file value
Then /^"([^"]*)" should equal "([^"]*)"$/ do |property, value|
    @props[property].should == value
end

# Check for string in file
Then /^"([^"]*)" should be present/ do |search_token| 
  output_lines = @run_command.run("grep \"#{search_token}\" #{@file_to_scrape}")
end

#-------------------------
# Directories
#-------------------------
# Test directory ownership
Then /^I should not be able to find any files under "([^"]*)" that are not owned by user "([^"]*)" in group "([^"]*)"$/ do |dir, user, group| 
  @output = @run_command.run("sudo find #{dir} ! -user #{user} ! -group #{group}")
  @output.strip.should be_empty
end




