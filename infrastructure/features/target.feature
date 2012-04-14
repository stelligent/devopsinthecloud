Feature: Scripted provisioning of target environment
    As a developer
    I would like a scripted installation of my target environment
    so that I can assume the environment will be the same everytime and my deployments will be predictable

    Background:
        Given I am sshed into the environment

    Scenario: Is the proper version of Passenger installed?
        When I run "gem list"
        Then I should see "passenger"
    
    Scenario: Is the proper version of Ruby installed?
      When I run "ruby -v"
      Then I should see "ruby 1.8.7"
    
    Scenario: Is the proper version of Ruby installed?
      When I run "httpd -v"
      Then I should see "Apache"
        
    Scenario: Httpd conf should have passenger variables
        When I read "/etc/httpd/conf/httpd.conf"
        Then "PassengerRoot" should equal "/usr/lib/ruby/gems/1.8/gems/passenger-3.0.11"
        
    Scenario 
        
    
