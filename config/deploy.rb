load 'deploy/assets'
require 'bundler/capistrano'

set :application, "ticktr-project"
set :repository,  "git@github.com:brian1987/ticktr-project.git"

#set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'brian'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

default_run_options[:pty] = true

role :web, "162.243.66.69"                          # Your HTTP server, Apache/etc
role :app, "162.243.66.69"                          # This may be the same as your `Web` server

# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
