# config/deploy.rb
#$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require 'rvm/capistrano'  # Add RVM integration
require 'bundler/capistrano'  # Add Bundler integration
load 'deploy/assets'  # only for rails 3.1 apps, this makes sure our assets are precompiled.

set :application, "bonde-da-uff"
role :web, "199.231.86.58"  # Your HTTP server, Apache/etc
role :app, "199.231.86.58"  # This may be the same as your `Web` server
role :db,  "199.231.86.58", :primary => true  # This is where Rails migrations will run

set :scm, :git
set :repository, "git@codeplane.com:startupdevrumble/bonde-da-uff.git"
set :branch, "master"

set :user, "deploy"
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :rvm_path, "/usr/local/rvm"
set :rvm_bin_path, "/usr/local/rvm/bin"

#set :application, "set your application name here"
#set :repository,  "set your repository location here"
#
#set :scm, :subversion
## Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
#
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
