Feature: Scripted provisioning of target environment
    As a developer
    I would like a scripted deployment
    so that I can assume the deployment will work the same way everytime

    Background:
        Given I am sshed into the environment

    Scenario: Is the rails application deployed into the correct directory?
        When I run "ls -las /var/www/rails/"
        Then I should see "Gemfile"
    
    Scenario Outline: Have all the required gems been installed?
        When I run "gem list"
        Then I should see "<gem>"
        
        Scenarios: Gems installed
        | gem    |
        | rails  |
        | sqlite |
            
    Scenario: Is the Apache service running?
        When I run "/sbin/chkconfig --list httpd"
        Then I should see "3:on"
        
    Scenario: The application is up and running
        When I run "/usr/bin/wget -qO- http://target.devopscloud.com"
        Then I should see "Sample App"
        
    
