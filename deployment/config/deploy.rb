set :application, "rails"
set :domain,      "target.devopscloud.com"
set :user,        "ec2-user"
set :use_sudo,    false
set :deploy_to,   "/var/www/#{application}"
set :ssh_options, {:forward_agent => true}

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :deploy_via, :remote_cache


after "deploy:deploy", "deploy:bundle_install"
after "deploy:bundle_install", "deploy:db_migrate"
after "deploy:db_migrate", "deploy:restart"

namespace :deploy do
  task :deploy do
    run "cd #{deploy_to} && sudo wget https://s3.amazonaws.com/stelligentlabs/devopsinthecloud.tar.gz"
    run "cd #{deploy_to} && sudo tar -zxf devopsinthecloud.tar.gz"
    run "cd #{deploy_to} && sudo rm devopsinthecloud.tar.gz"
  end
  
  task :bundle_install do
    run "cd #{deploy_to} && RAILS_ENV=production bundle install"
  end
  
  task :db_migrate do
    run "cd #{deploy_to} && sudo rake db:migrate"
  end
  
  task :start, :roles => :app do
    run "sudo service httpd start"
  end

  task :stop, :roles => :app do
    run "sudo service httpd stop"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "sudo service httpd restart"
  end
end