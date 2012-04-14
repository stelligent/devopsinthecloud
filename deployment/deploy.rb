set :application, "myapp"
set :domain,      "devopscloud.com"
set :repository,  "git@github.com:stelligent/sample_app.git"
set :use_sudo,    false
set :deploy_to,   "/www/var/#{application}"
set :scm,         "git"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end