Feature: Scripted provisioning of target environment
    As a developer
    I would like a scripted installation of my target environment
    so that I can assume the environment will be the same everytime and my deployments will be predictable

    Background:
        Given I am sshed into the environment

    Scenario: Is Passenger installed?
        When I run "gem list"
        Then I should see "passenger"

    Scenario: Is the proper version of Ruby installed?
        When I run "/usr/bin/ruby -v"
        Then I should see "ruby 2.0.0"

    Scenario: Is the proper version of Apache installed?
        When I run "/usr/sbin/httpd -v"
        Then I should see "2"

    Scenario: Is the Apache service running?
        When I run "/sbin/chkconfig --list httpd"
        Then I should see "3:on"

    Scenario: Httpd conf should have passenger variables
        When I scrape "/etc/httpd/conf/httpd.conf"
        Then "PassengerRoot /usr/local/share/ruby/gems/2.0/gems/passenger-5.0.7" should be present

    Scenario: Httpd conf should have a virtual host added
        When I scrape "/etc/httpd/conf/httpd.conf"
        Then "NameVirtualHost \*:80" should be present


